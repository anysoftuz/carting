// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServisModel _$ServisModelFromJson(Map<String, dynamic> json) => ServisModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ServisModelToJson(ServisModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
