// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) =>
    WarehouseModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      toLocation:
          ToLocation.fromJson(json['to_location'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      details:
          DetailsWarehouse.fromJson(json['details'] as Map<String, dynamic>),
      note: json['note'] as String,
    );

Map<String, dynamic> _$WarehouseModelToJson(WarehouseModel instance) =>
    <String, dynamic>{
      'adv_type': instance.advType,
      'service_type_id': instance.serviceTypeId,
      'to_location': instance.toLocation,
      'price': instance.price,
      'details': instance.details,
      'note': instance.note,
    };

DetailsWarehouse _$DetailsWarehouseFromJson(Map<String, dynamic> json) =>
    DetailsWarehouse(
      area: json['area'] as String,
    );

Map<String, dynamic> _$DetailsWarehouseToJson(DetailsWarehouse instance) =>
    <String, dynamic>{
      'area': instance.area,
    };

ToLocation _$ToLocationFromJson(Map<String, dynamic> json) => ToLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ToLocationToJson(ToLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
    };
