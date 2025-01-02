// To parse this JSON data, do
//
//     final transportTransferModel = transportTransferModelFromJson(jsonString);

import 'package:carting/data/models/location_model.dart';
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
  final String? shipmentDate;
  @JsonKey(name: "from_location")
  final LocationModel fromLocation;
  @JsonKey(name: "to_location")
  final LocationModel toLocation;
  @JsonKey(name: "pay_type")
  final String? payType;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "details")
  final DetailsTransfer details;
  @JsonKey(name: "note")
  final String note;

  TransportTransferModel({
    required this.advType,
    required this.serviceTypeId,
    this.shipmentDate,
    required this.fromLocation,
    required this.toLocation,
    this.payType,
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
class DetailsTransfer {
  @JsonKey(name: "transportation_type_id")
  final int transportationTypeId;
  @JsonKey(name: "transport_count")
  final int transportCount;

  DetailsTransfer({
    required this.transportationTypeId,
    required this.transportCount,
  });

  factory DetailsTransfer.fromJson(Map<String, dynamic> json) =>
      _$DetailsTransferFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsTransferToJson(this);
}
