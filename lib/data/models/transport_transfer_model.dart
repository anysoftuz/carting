// To parse this JSON data, do
//
//     final transportTransferModel = transportTransferModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transport_transfer_model.g.dart';

TransportTransferModel transportTransferModelFromJson(String str) =>
    TransportTransferModel.fromJson(json.decode(str));

String transportTransferModelToJson(TransportTransferModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TransportTransferModel {
  @JsonKey(name: "adv_type")
  final String advType;
  @JsonKey(name: "service_type_id")
  final int serviceTypeId;
  @JsonKey(name: "service_name")
  final String serviceName;
  @JsonKey(name: "shipment_date")
  final String shipmentDate;
  @JsonKey(name: "from_location")
  final Location fromLocation;
  @JsonKey(name: "to_location")
  final Location toLocation;
  @JsonKey(name: "pay_type")
  final String payType;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "details")
  final Details details;
  @JsonKey(name: "note")
  final String note;

  TransportTransferModel({
    required this.advType,
    required this.serviceTypeId,
    required this.shipmentDate,
    required this.fromLocation,
    required this.toLocation,
    required this.payType,
    required this.price,
    required this.details,
    required this.note,
    required this.serviceName,
  });

  factory TransportTransferModel.fromJson(Map<String, dynamic> json) =>
      _$TransportTransferModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransportTransferModelToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: "transportation_type_id")
  final int transportationTypeId;
  @JsonKey(name: "transport_count")
  final int transportCount;

  Details({
    required this.transportationTypeId,
    required this.transportCount,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
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
