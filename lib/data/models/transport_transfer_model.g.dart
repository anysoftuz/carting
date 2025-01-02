// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportTransferModel _$TransportTransferModelFromJson(
        Map<String, dynamic> json) =>
    TransportTransferModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      shipmentDate: json['shipment_date'] as String?,
      fromLocation:
          LocationModel.fromJson(json['from_location'] as Map<String, dynamic>),
      toLocation:
          LocationModel.fromJson(json['to_location'] as Map<String, dynamic>),
      payType: json['pay_type'] as String?,
      price: (json['price'] as num).toInt(),
      details:
          DetailsTransfer.fromJson(json['details'] as Map<String, dynamic>),
      note: json['note'] as String,
      serviceName: json['service_name'] as String,
    );

Map<String, dynamic> _$TransportTransferModelToJson(
        TransportTransferModel instance) =>
    <String, dynamic>{
      'adv_type': instance.advType,
      'service_type_id': instance.serviceTypeId,
      'service_name': instance.serviceName,
      'shipment_date': instance.shipmentDate,
      'from_location': instance.fromLocation,
      'to_location': instance.toLocation,
      'pay_type': instance.payType,
      'price': instance.price,
      'details': instance.details,
      'note': instance.note,
    };

DetailsTransfer _$DetailsTransferFromJson(Map<String, dynamic> json) =>
    DetailsTransfer(
      transportationTypeId: (json['transportation_type_id'] as num).toInt(),
      transportCount: (json['transport_count'] as num).toInt(),
    );

Map<String, dynamic> _$DetailsTransferToJson(DetailsTransfer instance) =>
    <String, dynamic>{
      'transportation_type_id': instance.transportationTypeId,
      'transport_count': instance.transportCount,
    };
