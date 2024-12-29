// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialEquipmentModel _$SpecialEquipmentModelFromJson(
        Map<String, dynamic> json) =>
    SpecialEquipmentModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      serviceName: json['service_name'] as String,
      toLocation:
          ToLocation.fromJson(json['to_location'] as Map<String, dynamic>),
      payType: json['pay_type'] as String,
      price: (json['price'] as num).toInt(),
      details: DetailsSpecial.fromJson(json['details'] as Map<String, dynamic>),
      note: json['note'] as String,
    );

Map<String, dynamic> _$SpecialEquipmentModelToJson(
        SpecialEquipmentModel instance) =>
    <String, dynamic>{
      'adv_type': instance.advType,
      'service_type_id': instance.serviceTypeId,
      'service_name': instance.serviceName,
      'to_location': instance.toLocation,
      'pay_type': instance.payType,
      'price': instance.price,
      'details': instance.details,
      'note': instance.note,
    };

DetailsSpecial _$DetailsSpecialFromJson(Map<String, dynamic> json) =>
    DetailsSpecial(
      transportationTypeId: (json['transportation_type_id'] as num).toInt(),
      fromDate: json['from_date'] as String,
      toDate: json['to_date'] as String,
    );

Map<String, dynamic> _$DetailsSpecialToJson(DetailsSpecial instance) =>
    <String, dynamic>{
      'transportation_type_id': instance.transportationTypeId,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
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
