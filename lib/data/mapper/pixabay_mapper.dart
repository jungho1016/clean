import 'package:clean/data/dto/pixabay_result_dto.dart';
import 'package:clean/domain/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
        id: id ?? 0,
        views: views ?? 0,
        downloads: downloads ?? 0,
        collections: collections ?? 0,
        likes: likes ?? 0,
        comments: comments ?? 0,
        webformatURL: webformatURL ?? '',
        tags: tags ?? '');
  }
}
