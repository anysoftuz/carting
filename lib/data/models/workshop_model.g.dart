// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkshopModel _$WorkshopModelFromJson(Map<String, dynamic> json) =>
    WorkshopModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      fromLocation:
          LocationModel.fromJson(json['from_location'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      details:
          DetailsWorkshop.fromJson(json['details'] as Map<String, dynamic>),
      note: json['note'] as String,
    );

Map<String, dynamic> _$WorkshopModelToJson(WorkshopModel instance) =>
    <String, dynamic>{
      'adv_type': instance.advType,
      'service_type_id': instance.serviceTypeId,
      'from_location': instance.fromLocation,
      'price': instance.price,
      'details': instance.details,
      'note': instance.note,
    };

DetailsWorkshop _$DetailsWorkshopFromJson(Map<String, dynamic> json) =>
    DetailsWorkshop(
      repairTypeId: (json['repair_type_id'] as num).toInt(),
      category: (json['category'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      services: (json['services'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      companyName: json['company_name'] as String,
    );

Map<String, dynamic> _$DetailsWorkshopToJson(DetailsWorkshop instance) =>
    <String, dynamic>{
      'repair_type_id': instance.repairTypeId,
      'category': instance.category,
      'services': instance.services,
      'company_name': instance.companyName,
    };
