// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_equipment_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialEquipmentCreateModel _$SpecialEquipmentCreateModelFromJson(
        Map<String, dynamic> json) =>
    SpecialEquipmentCreateModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      toLocation:
          LocationModel.fromJson(json['to_location'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      details: DetailsSpecialEquipment.fromJson(
          json['details'] as Map<String, dynamic>),
      note: json['note'] as String,
    );

Map<String, dynamic> _$SpecialEquipmentCreateModelToJson(
        SpecialEquipmentCreateModel instance) =>
    <String, dynamic>{
      'adv_type': instance.advType,
      'service_type_id': instance.serviceTypeId,
      'to_location': instance.toLocation,
      'price': instance.price,
      'details': instance.details,
      'note': instance.note,
    };

DetailsSpecialEquipment _$DetailsSpecialEquipmentFromJson(
        Map<String, dynamic> json) =>
    DetailsSpecialEquipment(
      transportationTypeId: (json['transportation_type_id'] as num).toInt(),
    );

Map<String, dynamic> _$DetailsSpecialEquipmentToJson(
        DetailsSpecialEquipment instance) =>
    <String, dynamic>{
      'transportation_type_id': instance.transportationTypeId,
    };
