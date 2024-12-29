// To parse this JSON data, do
//
//     final peregonModel = peregonModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'peregon_model.g.dart';

PeregonModel peregonModelFromJson(String str) =>
    PeregonModel.fromJson(json.decode(str));

String peregonModelToJson(PeregonModel data) => json.encode(data.toJson());

@JsonSerializable()
class PeregonModel {
  @JsonKey(name: "adv_type")
  final String advType;
  @JsonKey(name: "service_type_id")
  final int serviceTypeId;
  @JsonKey(name: "service_name")
  final String serviceName;
  @JsonKey(name: "shipment_date")
  final String shipmentDate;
  @JsonKey(name: "from_location")
  final Location fromLocation;
  @JsonKey(name: "to_location")
  final Location toLocation;
  @JsonKey(name: "pay_type")
  final String payType;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "note")
  final String note;

  PeregonModel({
    required this.advType,
    required this.serviceTypeId,
    required this.serviceName,
    required this.shipmentDate,
    required this.fromLocation,
    required this.toLocation,
    required this.payType,
    required this.price,
    required this.note,
  });

  factory PeregonModel.fromJson(Map<String, dynamic> json) =>
      _$PeregonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeregonModelToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lng")
  final double lng;
  @JsonKey(name: "name")
  final String name;

  Location({
    required this.lat,
    required this.lng,
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
