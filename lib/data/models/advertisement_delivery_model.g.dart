// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertisementDeliveryModel _$AdvertisementDeliveryModelFromJson(
        Map<String, dynamic> json) =>
    AdvertisementDeliveryModel(
      advType: json['adv_type'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      fromLocation:
          LocationModel.fromJson(json['from_location'] as Map<String, dynamic>),
      toLocation:
          LocationModel.fromJson(json['to_location'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
      note: json['note'] as String,
      serviceName: json['service_name'] as String,
    );

Map<String, dynamic> _$AdvertisementDeliveryModelToJson(
        AdvertisementDeliveryModel instance) =>
    <String, dynamic>{
      'adv_type': instance.advType,
      'service_type_id': instance.serviceTypeId,
      'from_location': instance.fromLocation,
      'to_location': instance.toLocation,
      'price': instance.price,
      'details': instance.details,
      'note': instance.note,
      'service_name': instance.serviceName,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      transportationTypeId: (json['transportation_type_id'] as num).toInt(),
      loadWeight:
          LoadWeight.fromJson(json['load_weight'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'transportation_type_id': instance.transportationTypeId,
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
