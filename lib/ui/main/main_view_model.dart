import 'package:clean/ui/main/main_state.dart';
import 'package:flutter/material.dart';

import '../../data/repository/photo_repository.dart';

class MainViewModel with ChangeNotifier {
  final PhotoRepository _repository;

  MainViewModel(this._repository);

  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final photos = await _repository.getPhoto(query);

    _state = state.copyWith(
      isLoading: false,
      photos: photos,
    );
    notifyListeners();
  }
}
