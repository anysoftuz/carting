// To parse this JSON data, do
//
//     final fuelsInfoModel = fuelsInfoModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'fuels_info_model.g.dart';

List<FuelsInfoModel> fuelsInfoModelFromJson(String str) => List<FuelsInfoModel>.from(json.decode(str).map((x) => FuelsInfoModel.fromJson(x)));

String fuelsInfoModelToJson(List<FuelsInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class FuelsInfoModel {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "delivery_price")
    final int deliveryPrice;
    @JsonKey(name: "company_name")
    final String companyName;
    @JsonKey(name: "fuel_id")
    final String fuelId;
    @JsonKey(name: "type")
    final String type;
    @JsonKey(name: "price")
    final int price;

    FuelsInfoModel({
        required this.id,
        required this.deliveryPrice,
        required this.companyName,
        required this.fuelId,
        required this.type,
        required this.price,
    });

    factory FuelsInfoModel.fromJson(Map<String, dynamic> json) => _$FuelsInfoModelFromJson(json);

    Map<String, dynamic> toJson() => _$FuelsInfoModelToJson(this);
}
