import 'package:clean/domain/model/photo.dart';
import 'package:clean/domain/repository/photo_repository.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PhotoRepository _repository;
  GetTopFiveMostViewedImagesUseCase(this._repository);

  Future<List<Photo>> excute(String query) async {
    final photos = await _repository.getPhoto(query);
    photos.sort((a, b) => -a.views.compareTo(b.views));
    return photos.take(5).toList();
  }
}
