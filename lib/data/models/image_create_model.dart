// To parse this JSON data, do
//
//     final imageCreateModel = imageCreateModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'image_create_model.g.dart';

ImageCreateModel imageCreateModelFromJson(String str) =>
    ImageCreateModel.fromJson(json.decode(str));

String imageCreateModelToJson(ImageCreateModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ImageCreateModel {
  @JsonKey(name: "advertisement_id")
  final int advertisementId;
  @JsonKey(name: "images")
  final List<ImageFiles> images;

  ImageCreateModel({
    required this.advertisementId,
    required this.images,
  });

  factory ImageCreateModel.fromJson(Map<String, dynamic> json) =>
      _$ImageCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageCreateModelToJson(this);
}

@JsonSerializable()
class ImageFiles {
  @JsonKey(name: "fileName")
  final String fileName;
  @JsonKey(name: "base64")
  final String base64;

  ImageFiles({
    required this.fileName,
    required this.base64,
  });

  factory ImageFiles.fromJson(Map<String, dynamic> json) =>
      _$ImageFilesFromJson(json);

  Map<String, dynamic> toJson() => _$ImageFilesToJson(this);
}
