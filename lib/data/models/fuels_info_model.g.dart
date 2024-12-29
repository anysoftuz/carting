// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuels_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuelsInfoModel _$FuelsInfoModelFromJson(Map<String, dynamic> json) =>
    FuelsInfoModel(
      id: (json['id'] as num).toInt(),
      deliveryPrice: (json['delivery_price'] as num).toInt(),
      companyName: json['company_name'] as String,
      fuelId: json['fuel_id'] as String,
      type: json['type'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$FuelsInfoModelToJson(FuelsInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery_price': instance.deliveryPrice,
      'company_name': instance.companyName,
      'fuel_id': instance.fuelId,
      'type': instance.type,
      'price': instance.price,
    };
