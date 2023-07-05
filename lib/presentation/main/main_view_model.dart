import 'package:flutter/material.dart';

import '../../domain/repository/photo_repository.dart';
import 'main_state.dart';

class MainViewModel with ChangeNotifier {
  final PhotoRepository _repository;

  MainViewModel(this._repository);

  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final photos = await _repository.getPhoto(query);
    photos.sort((a, b) => -a.views.compareTo(b.views));

    _state = state.copyWith(
      isLoading: false,
      photos: photos.take(5).toList(),
    );
    notifyListeners();
  }
}
