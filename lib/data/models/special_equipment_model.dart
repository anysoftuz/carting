// To parse this JSON data, do
//
//     final specialEquipmentModel = specialEquipmentModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'special_equipment_model.g.dart';

SpecialEquipmentModel specialEquipmentModelFromJson(String str) =>
    SpecialEquipmentModel.fromJson(json.decode(str));

String specialEquipmentModelToJson(SpecialEquipmentModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SpecialEquipmentModel {
  @JsonKey(name: "adv_type")
  final String advType;
  @JsonKey(name: "service_type_id")
  final int serviceTypeId;
  @JsonKey(name: "service_name")
  final String serviceName;
  @JsonKey(name: "to_location")
  final ToLocation toLocation;
  @JsonKey(name: "pay_type")
  final String payType;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "details")
  final DetailsSpecial details;
  @JsonKey(name: "note")
  final String note;

  SpecialEquipmentModel({
    required this.advType,
    required this.serviceTypeId,
    required this.serviceName,
    required this.toLocation,
    required this.payType,
    required this.price,
    required this.details,
    required this.note,
  });

  factory SpecialEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialEquipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialEquipmentModelToJson(this);
}

@JsonSerializable()
class DetailsSpecial {
  @JsonKey(name: "transportation_type_id")
  final int transportationTypeId;
  @JsonKey(name: "from_date")
  final String fromDate;
  @JsonKey(name: "to_date")
  final String toDate;

  DetailsSpecial({
    required this.transportationTypeId,
    required this.fromDate,
    required this.toDate,
  });

  factory DetailsSpecial.fromJson(Map<String, dynamic> json) =>
      _$DetailsSpecialFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsSpecialToJson(this);
}

@JsonSerializable()
class ToLocation {
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lng")
  final double lng;
  @JsonKey(name: "name")
  final String name;

  ToLocation({
    required this.lat,
    required this.lng,
    required this.name,
  });

  factory ToLocation.fromJson(Map<String, dynamic> json) =>
      _$ToLocationFromJson(json);

  Map<String, dynamic> toJson() => _$ToLocationToJson(this);
}
