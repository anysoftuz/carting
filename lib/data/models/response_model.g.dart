// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel<T> _$ResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseModel<T>(
      error: json['error'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: (json['status'] as num).toInt(),
      path: json['path'],
      data: fromJsonT(json['data']),
      response: json['response'],
    );

Map<String, dynamic> _$ResponseModelToJson<T>(
  ResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': instance.status,
      'path': instance.path,
      'data': toJsonT(instance.data),
      'response': instance.response,
    };
