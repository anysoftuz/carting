// To parse this JSON data, do
//
//     final warehouseModel = warehouseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'warehouse_model.g.dart';

WarehouseModel warehouseModelFromJson(String str) => WarehouseModel.fromJson(json.decode(str));

String warehouseModelToJson(WarehouseModel data) => json.encode(data.toJson());

@JsonSerializable()
class WarehouseModel {
    @JsonKey(name: "adv_type")
    final String advType;
    @JsonKey(name: "service_type_id")
    final int serviceTypeId;
    @JsonKey(name: "to_location")
    final ToLocation toLocation;
    @JsonKey(name: "price")
    final int price;
    @JsonKey(name: "details")
    final DetailsWarehouse details;
    @JsonKey(name: "note")
    final String note;

    WarehouseModel({
        required this.advType,
        required this.serviceTypeId,
        required this.toLocation,
        required this.price,
        required this.details,
        required this.note,
    });

    factory WarehouseModel.fromJson(Map<String, dynamic> json) => _$WarehouseModelFromJson(json);

    Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);
}

@JsonSerializable()
class DetailsWarehouse {
    @JsonKey(name: "area")
    final String area;

    DetailsWarehouse({
        required this.area,
    });

    factory DetailsWarehouse.fromJson(Map<String, dynamic> json) => _$DetailsWarehouseFromJson(json);

    Map<String, dynamic> toJson() => _$DetailsWarehouseToJson(this);
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

    factory ToLocation.fromJson(Map<String, dynamic> json) => _$ToLocationFromJson(json);

    Map<String, dynamic> toJson() => _$ToLocationToJson(this);
}
