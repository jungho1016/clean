import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/pixabay_result_dto.dart';

class PixabayApi {
  Future<PixabayResultDto> getApi(String query) async {
    const String url =
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=&image_type=photo&pretty=true';
    final http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonString = jsonDecode(response.body);
    return PixabayResultDto.fromJson(jsonString);
  }
}
