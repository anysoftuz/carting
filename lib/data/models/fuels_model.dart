// To parse this JSON data, do
//
//     final fuelsModel = fuelsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'fuels_model.g.dart';

List<FuelsModel> fuelsModelFromJson(String str) => List<FuelsModel>.from(json.decode(str).map((x) => FuelsModel.fromJson(x)));

String fuelsModelToJson(List<FuelsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class FuelsModel {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "type")
    final String type;
    @JsonKey(name: "price")
    final String price;

    FuelsModel({
        required this.id,
        required this.type,
        required this.price,
    });

    factory FuelsModel.fromJson(Map<String, dynamic> json) => _$FuelsModelFromJson(json);

    Map<String, dynamic> toJson() => _$FuelsModelToJson(this);
}
