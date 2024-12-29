// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transportation_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportationTypesModel _$TransportationTypesModelFromJson(
        Map<String, dynamic> json) =>
    TransportationTypesModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      volume: json['volume'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$TransportationTypesModelToJson(
        TransportationTypesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'volume': instance.volume,
      'icon': instance.icon,
    };
