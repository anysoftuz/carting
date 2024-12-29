// To parse this JSON data, do
//
//     final deliveryCreateModel = deliveryCreateModelFromJson(jsonString);

import 'package:carting/data/models/location_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'delivery_create_model.g.dart';

DeliveryCreateModel deliveryCreateModelFromJson(String str) =>
    DeliveryCreateModel.fromJson(json.decode(str));

String deliveryCreateModelToJson(DeliveryCreateModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class DeliveryCreateModel {
  @JsonKey(name: "adv_type")
  final String advType;
  @JsonKey(name: "service_type_id")
  final int serviceTypeId;
  @JsonKey(name: "service_name")
  final String serviceName;
  @JsonKey(name: "shipment_date")
  final String shipmentDate;
  @JsonKey(name: "from_location")
  final LocationModel fromLocation;
  @JsonKey(name: "to_location")
  final LocationModel toLocation;
  @JsonKey(name: "pay_type")
  final String payType;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "details")
  final Details details;
  @JsonKey(name: "note")
  final String note;

  DeliveryCreateModel({
    required this.advType,
    required this.serviceTypeId,
    required this.shipmentDate,
    required this.fromLocation,
    required this.toLocation,
    required this.payType,
    required this.price,
    required this.details,
    required this.note,
    required this.serviceName,
  });

  factory DeliveryCreateModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryCreateModelToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: "transportation_type_id")
  final int transportationTypeId;
  @JsonKey(name: "load_type_id")
  final String loadTypeId;
  @JsonKey(name: "load_service_id")
  final String loadServiceId;
  @JsonKey(name: "load_weight")
  final LoadWeight loadWeight;

  Details({
    required this.transportationTypeId,
    required this.loadTypeId,
    required this.loadServiceId,
    required this.loadWeight,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class LoadWeight {
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "name")
  final String name;

  LoadWeight({
    required this.amount,
    required this.name,
  });

  factory LoadWeight.fromJson(Map<String, dynamic> json) =>
      _$LoadWeightFromJson(json);

  Map<String, dynamic> toJson() => _$LoadWeightToJson(this);
}
