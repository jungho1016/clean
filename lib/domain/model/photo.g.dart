// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Photo _$$_PhotoFromJson(Map<String, dynamic> json) => _$_Photo(
      id: json['id'] as int,
      views: json['views'] as int,
      downloads: json['downloads'] as int,
      collections: json['collections'] as int,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
      webformatURL: json['webformatURL'] as String,
      tags: json['tags'] as String,
    );

Map<String, dynamic> _$$_PhotoToJson(_$_Photo instance) => <String, dynamic>{
      'id': instance.id,
      'views': instance.views,
      'downloads': instance.downloads,
      'collections': instance.collections,
      'likes': instance.likes,
      'comments': instance.comments,
      'webformatURL': instance.webformatURL,
      'tags': instance.tags,
    };
