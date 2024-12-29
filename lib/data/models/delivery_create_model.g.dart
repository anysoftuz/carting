// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryCreateModel _$DeliveryCreateModelFromJson(Map<String, dynamic> json) =>
    DeliveryCreateModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      shipmentDate: json['shipment_date'] as String,
      fromLocation:
          LocationModel.fromJson(json['from_location'] as Map<String, dynamic>),
      toLocation:
          LocationModel.fromJson(json['to_location'] as Map<String, dynamic>),
      payType: json['pay_type'] as String,
      price: (json['price'] as num).toInt(),
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
      note: json['note'] as String,
      serviceName: json['service_name'] as String,
    );

Map<String, dynamic> _$DeliveryCreateModelToJson(
        DeliveryCreateModel instance) =>
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

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      transportationTypeId: (json['transportation_type_id'] as num).toInt(),
      loadTypeId: json['load_type_id'] as String,
      loadServiceId: json['load_service_id'] as String,
      loadWeight:
          LoadWeight.fromJson(json['load_weight'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'transportation_type_id': instance.transportationTypeId,
      'load_type_id': instance.loadTypeId,
      'load_service_id': instance.loadServiceId,
      'load_weight': instance.loadWeight,
    };

LoadWeight _$LoadWeightFromJson(Map<String, dynamic> json) => LoadWeight(
      amount: (json['amount'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$LoadWeightToJson(LoadWeight instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'name': instance.name,
    };
