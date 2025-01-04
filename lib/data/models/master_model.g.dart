// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterModel _$MasterModelFromJson(Map<String, dynamic> json) => MasterModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      fromLocation:
          LocationModel.fromJson(json['from_location'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      details: DetailsMaster.fromJson(json['details'] as Map<String, dynamic>),
      note: json['note'] as String,
    );

Map<String, dynamic> _$MasterModelToJson(MasterModel instance) =>
    <String, dynamic>{
      'adv_type': instance.advType,
      'service_type_id': instance.serviceTypeId,
      'from_location': instance.fromLocation,
      'price': instance.price,
      'details': instance.details,
      'note': instance.note,
    };

DetailsMaster _$DetailsMasterFromJson(Map<String, dynamic> json) =>
    DetailsMaster(
      repairTypeId: (json['repair_type_id'] as num).toInt(),
      services: (json['services'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      transportSpecialistId: (json['transport_specialist_id'] as num).toInt(),
      specialistFirstName: json['specialist_first_name'] as String,
      specialistLastName: json['specialist_last_name'] as String,
    );

Map<String, dynamic> _$DetailsMasterToJson(DetailsMaster instance) =>
    <String, dynamic>{
      'repair_type_id': instance.repairTypeId,
      'services': instance.services,
      'transport_specialist_id': instance.transportSpecialistId,
      'specialist_first_name': instance.specialistFirstName,
      'specialist_last_name': instance.specialistLastName,
    };
