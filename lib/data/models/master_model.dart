// To parse this JSON data, do
//
//     final masterModel = masterModelFromJson(jsonString);

import 'package:carting/data/models/location_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'master_model.g.dart';

MasterModel masterModelFromJson(String str) => MasterModel.fromJson(json.decode(str));

String masterModelToJson(MasterModel data) => json.encode(data.toJson());

@JsonSerializable()
class MasterModel {
    @JsonKey(name: "adv_type")
    final String advType;
    @JsonKey(name: "service_type_id")
    final int serviceTypeId;
    @JsonKey(name: "from_location")
    final LocationModel fromLocation;
    @JsonKey(name: "price")
    final int price;
    @JsonKey(name: "details")
    final DetailsMaster details;
    @JsonKey(name: "note")
    final String note;

    MasterModel({
        required this.advType,
        required this.serviceTypeId,
        required this.fromLocation,
        required this.price,
        required this.details,
        required this.note,
    });

    factory MasterModel.fromJson(Map<String, dynamic> json) => _$MasterModelFromJson(json);

    Map<String, dynamic> toJson() => _$MasterModelToJson(this);
}

@JsonSerializable()
class DetailsMaster {
    @JsonKey(name: "repair_type_id")
    final int repairTypeId;
    @JsonKey(name: "services")
    final List<int> services;
    @JsonKey(name: "transport_specialist_id")
    final int transportSpecialistId;
    @JsonKey(name: "specialist_first_name")
    final String specialistFirstName;
    @JsonKey(name: "specialist_last_name")
    final String specialistLastName;

    DetailsMaster({
        required this.repairTypeId,
        required this.services,
        required this.transportSpecialistId,
        required this.specialistFirstName,
        required this.specialistLastName,
    });

    factory DetailsMaster.fromJson(Map<String, dynamic> json) => _$DetailsMasterFromJson(json);

    Map<String, dynamic> toJson() => _$DetailsMasterToJson(this);
}

