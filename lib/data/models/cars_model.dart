// To parse this JSON data, do
//
//     final carsModel = carsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'cars_model.g.dart';

CarsModel carsModelFromJson(String str) => CarsModel.fromJson(json.decode(str));

String carsModelToJson(CarsModel data) => json.encode(data.toJson());

@JsonSerializable()
class CarsModel {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "name")
    final String name;
    @JsonKey(name: "fuel_type")
    final String fuelType;
    @JsonKey(name: "type_id")
    final String typeId;

    CarsModel({
        required this.id,
        required this.name,
        required this.fuelType,
        required this.typeId,
    });

    factory CarsModel.fromJson(Map<String, dynamic> json) => _$CarsModelFromJson(json);

    Map<String, dynamic> toJson() => _$CarsModelToJson(this);
}
