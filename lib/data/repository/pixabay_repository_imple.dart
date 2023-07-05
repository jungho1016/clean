import 'package:clean/data/api/pixabay_api.dart';
import 'package:clean/data/dto/pixabay_result_dto.dart';
import 'package:clean/data/mapper/pixabay_mapper.dart';
import 'package:clean/data/model/photo.dart';
import 'package:clean/data/repository/photo_repository.dart';

class PixbayResultRepository implements PhotoRepository {
  final PixabayApi _api = PixabayApi();

  @override
  Future<List<Photo>> getPhoto(String query) async {
    final PixabayResultDto resultDto = await _api.getApi(query);
    if (resultDto.hits == null) {
      return [];
    }
    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}
