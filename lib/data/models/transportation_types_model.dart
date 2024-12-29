// To parse this JSON data, do
//
//     final transportationTypesModel = transportationTypesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transportation_types_model.g.dart';

TransportationTypesModel transportationTypesModelFromJson(String str) =>
    TransportationTypesModel.fromJson(json.decode(str));

String transportationTypesModelToJson(TransportationTypesModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TransportationTypesModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "volume")
  final String volume;
  @JsonKey(name: "icon")
  final String icon;

  TransportationTypesModel({
    this.id = 0,
    this.name = '',
    this.volume = '',
    this.icon = '',
  });

  factory TransportationTypesModel.fromJson(Map<String, dynamic> json) =>
      _$TransportationTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransportationTypesModelToJson(this);
}
