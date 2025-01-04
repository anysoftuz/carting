// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageCreateModel _$ImageCreateModelFromJson(Map<String, dynamic> json) =>
    ImageCreateModel(
      advertisementId: (json['advertisement_id'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageFiles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageCreateModelToJson(ImageCreateModel instance) =>
    <String, dynamic>{
      'advertisement_id': instance.advertisementId,
      'images': instance.images,
    };

ImageFiles _$ImageFilesFromJson(Map<String, dynamic> json) => ImageFiles(
      fileName: json['fileName'] as String,
      base64: json['base64'] as String,
    );

Map<String, dynamic> _$ImageFilesToJson(ImageFiles instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'base64': instance.base64,
    };
