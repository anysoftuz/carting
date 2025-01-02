// To parse this JSON data, do
//
//     final advertisementDeliveryModel = advertisementDeliveryModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'advertisement_delivery_model.g.dart';

AdvertisementDeliveryModel advertisementDeliveryModelFromJson(String str) =>
    AdvertisementDeliveryModel.fromJson(json.decode(str));

String advertisementDeliveryModelToJson(AdvertisementDeliveryModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AdvertisementDeliveryModel {
  @JsonKey(name: "adv_type")
  final String advType;
  @JsonKey(name: "service_type_id")
  final int serviceTypeId;
  @JsonKey(name: "from_location")
  final Location fromLocation;
  @JsonKey(name: "to_location")
  final Location toLocation;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "details")
  final Details details;
  @JsonKey(name: "note")
  final String note;
  @JsonKey(name: "service_name")
  final String serviceName;

  AdvertisementDeliveryModel({
    required this.advType,
    required this.serviceTypeId,
    required this.fromLocation,
    required this.toLocation,
    required this.price,
    required this.details,
    required this.note,
    required this.serviceName,
  });

  factory AdvertisementDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementDeliveryModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementDeliveryModelToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: "transportation_type_id")
  final int transportationTypeId;
  @JsonKey(name: "load_weight")
  final LoadWeight loadWeight;

  Details({
    required this.transportationTypeId,
    required this.loadWeight,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class LoadWeight {
  @JsonKey(name: "amount")
  final int amount;
  @JsonKey(name: "name")
  final String name;

  LoadWeight({
    required this.amount,
    required this.name,
  });

  factory LoadWeight.fromJson(Map<String, dynamic> json) =>
      _$LoadWeightFromJson(json);

  Map<String, dynamic> toJson() => _$LoadWeightToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lng")
  final double lng;
  @JsonKey(name: "name")
  final String name;

  Location({
    required this.lat,
    required this.lng,
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
