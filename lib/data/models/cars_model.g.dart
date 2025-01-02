// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarsModel _$CarsModelFromJson(Map<String, dynamic> json) => CarsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      fuelType: json['fuel_type'] as String,
      typeId: json['type_id'] as String,
    );

Map<String, dynamic> _$CarsModelToJson(CarsModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fuel_type': instance.fuelType,
      'type_id': instance.typeId,
    };
