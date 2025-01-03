// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_specialists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportSpecialistsModel _$TransportSpecialistsModelFromJson(
        Map<String, dynamic> json) =>
    TransportSpecialistsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      majority: json['majority'] as String,
    );

Map<String, dynamic> _$TransportSpecialistsModelToJson(
        TransportSpecialistsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'majority': instance.majority,
    };
