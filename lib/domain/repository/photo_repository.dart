import 'package:clean/domain/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhoto(String query);
}
