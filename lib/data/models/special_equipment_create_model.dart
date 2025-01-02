// To parse this JSON data, do
//
//     final specialEquipmentCreateModel = specialEquipmentCreateModelFromJson(jsonString);

import 'package:carting/data/models/location_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'special_equipment_create_model.g.dart';

SpecialEquipmentCreateModel specialEquipmentCreateModelFromJson(String str) => SpecialEquipmentCreateModel.fromJson(json.decode(str));

String specialEquipmentCreateModelToJson(SpecialEquipmentCreateModel data) => json.encode(data.toJson());

@JsonSerializable()
class SpecialEquipmentCreateModel {
    @JsonKey(name: "adv_type")
    final String advType;
    @JsonKey(name: "service_type_id")
    final int serviceTypeId;
    @JsonKey(name: "to_location")
    final LocationModel toLocation;
    @JsonKey(name: "price")
    final int price;
    @JsonKey(name: "details")
    final DetailsSpecialEquipment details;
    @JsonKey(name: "note")
    final String note;

    SpecialEquipmentCreateModel({
        required this.advType,
        required this.serviceTypeId,
        required this.toLocation,
        required this.price,
        required this.details,
        required this.note,
    });

    factory SpecialEquipmentCreateModel.fromJson(Map<String, dynamic> json) => _$SpecialEquipmentCreateModelFromJson(json);

    Map<String, dynamic> toJson() => _$SpecialEquipmentCreateModelToJson(this);
}

@JsonSerializable()
class DetailsSpecialEquipment {
    @JsonKey(name: "transportation_type_id")
    final int transportationTypeId;

    DetailsSpecialEquipment({
        required this.transportationTypeId,
    });

    factory DetailsSpecialEquipment.fromJson(Map<String, dynamic> json) => _$DetailsSpecialEquipmentFromJson(json);

    Map<String, dynamic> toJson() => _$DetailsSpecialEquipmentToJson(this);
}

