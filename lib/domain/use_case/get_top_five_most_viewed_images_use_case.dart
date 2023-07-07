import 'package:clean/domain/model/photo.dart';
import 'package:clean/domain/repository/photo_repository.dart';

import '../../core/result.dart';

class GetTopFiveMostViewedImagesUseCase {
  final PhotoRepository _repository;
  GetTopFiveMostViewedImagesUseCase(this._repository);

  Future<Result<List<Photo>>> execute(String query) async {
    try {
      final photos = await _repository.getPhoto(query);
      photos.sort((a, b) => -a.views.compareTo(b.views));
      return Result.success(photos.take(5).toList());
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
