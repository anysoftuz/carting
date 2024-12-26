import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseModel<T> {
  @JsonKey(name: "error")
  final dynamic error;

  @JsonKey(name: "message")
  final dynamic message;

  @JsonKey(name: "timestamp")
  final DateTime timestamp;

  @JsonKey(name: "status")
  final int status;

  @JsonKey(name: "path")
  final dynamic path;

  @JsonKey(name: "data")
  final T data;

  @JsonKey(name: "response")
  final dynamic response;

  ResponseModel({
    required this.error,
    required this.message,
    required this.timestamp,
    required this.status,
    required this.path,
    required this.data,
    required this.response,
  });

  /// JSON dan obyektni yaratish
  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fetch,
  ) =>
      _$ResponseModelFromJson(json, fetch);

  /// JSON ga obyektni o'girish
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ResponseModelToJson(this, toJsonT);
}
