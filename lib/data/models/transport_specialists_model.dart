// To parse this JSON data, do
//
//     final transportSpecialistsModel = transportSpecialistsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transport_specialists_model.g.dart';

TransportSpecialistsModel transportSpecialistsModelFromJson(String str) => TransportSpecialistsModel.fromJson(json.decode(str));

String transportSpecialistsModelToJson(TransportSpecialistsModel data) => json.encode(data.toJson());

@JsonSerializable()
class TransportSpecialistsModel {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "name")
    final String name;
    @JsonKey(name: "majority")
    final String majority;

    TransportSpecialistsModel({
        required this.id,
        required this.name,
        required this.majority,
    });

    factory TransportSpecialistsModel.fromJson(Map<String, dynamic> json) => _$TransportSpecialistsModelFromJson(json);

    Map<String, dynamic> toJson() => _$TransportSpecialistsModelToJson(this);
}
