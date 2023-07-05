import 'package:clean/domain/model/photo.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;

  const DetailScreen({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 이미지 : ${photo.views}'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Hero(
        tag: photo.id,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              photo.webformatURL,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
