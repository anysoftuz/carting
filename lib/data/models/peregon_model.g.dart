// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peregon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeregonModel _$PeregonModelFromJson(Map<String, dynamic> json) => PeregonModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      serviceName: json['service_name'] as String,
      shipmentDate: json['shipment_date'] as String,
      fromLocation:
          Location.fromJson(json['from_location'] as Map<String, dynamic>),
      toLocation:
          Location.fromJson(json['to_location'] as Map<String, dynamic>),
      payType: json['pay_type'] as String,
      price: (json['price'] as num).toInt(),
      note: json['note'] as String,
    );

Map<String, dynamic> _$PeregonModelToJson(PeregonModel instance) =>
    <String, dynamic>{
      'adv_type': instance.advType,
      'service_type_id': instance.serviceTypeId,
      'service_name': instance.serviceName,
      'shipment_date': instance.shipmentDate,
      'from_location': instance.fromLocation,
      'to_location': instance.toLocation,
      'pay_type': instance.payType,
      'price': instance.price,
      'note': instance.note,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
    };
