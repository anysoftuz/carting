// To parse this JSON data, do
//
//     final workshopModel = workshopModelFromJson(jsonString);

import 'package:carting/data/models/location_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'workshop_model.g.dart';

WorkshopModel workshopModelFromJson(String str) =>
    WorkshopModel.fromJson(json.decode(str));

String workshopModelToJson(WorkshopModel data) => json.encode(data.toJson());

@JsonSerializable()
class WorkshopModel {
  @JsonKey(name: "adv_type")
  final String advType;
  @JsonKey(name: "service_type_id")
  final int serviceTypeId;
  @JsonKey(name: "from_location")
  final LocationModel fromLocation;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "details")
  final DetailsWorkshop details;
  @JsonKey(name: "note")
  final String note;

  WorkshopModel({
    required this.advType,
    required this.serviceTypeId,
    required this.fromLocation,
    required this.price,
    required this.details,
    required this.note,
  });

  factory WorkshopModel.fromJson(Map<String, dynamic> json) =>
      _$WorkshopModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkshopModelToJson(this);
}

@JsonSerializable()
class DetailsWorkshop {
  @JsonKey(name: "repair_type_id")
  final int repairTypeId;
  @JsonKey(name: "category")
  final List<int> category;
  @JsonKey(name: "services")
  final List<int> services;
  @JsonKey(name: "company_name")
  final String companyName;

  DetailsWorkshop({
    required this.repairTypeId,
    required this.category,
    required this.services,
    required this.companyName,
  });

  factory DetailsWorkshop.fromJson(Map<String, dynamic> json) =>
      _$DetailsWorkshopFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsWorkshopToJson(this);
}
