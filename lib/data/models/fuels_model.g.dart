// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuels_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuelsModel _$FuelsModelFromJson(Map<String, dynamic> json) => FuelsModel(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$FuelsModelToJson(FuelsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'price': instance.price,
    };
