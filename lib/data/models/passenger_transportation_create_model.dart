// To parse this JSON data, do
//
//     final PassengerTransportationCreateModel = PassengerTransportationCreateModelFromJson(jsonString);

import 'package:carting/data/models/location_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'passenger_transportation_create_model.g.dart';

PassengerTransportationCreateModel passengerTransportationCreateModelFromJson(
        String str) =>
    PassengerTransportationCreateModel.fromJson(json.decode(str));

String passengerTransportationCreateModelToJson(
        PassengerTransportationCreateModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PassengerTransportationCreateModel {
  @JsonKey(name: "adv_type")
  final String advType;
  @JsonKey(name: "service_type_id")
  final int serviceTypeId;
  @JsonKey(name: "service_name")
  final String serviceName;
  @JsonKey(name: "shipment_date")
  final String shipmentDate;
  @JsonKey(name: "from_location")
  final LocationModel fromLocation;
  @JsonKey(name: "to_location")
  final LocationModel toLocation;
  @JsonKey(name: "pay_type")
  final String payType;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "details")
  final DetailsModel details;
  @JsonKey(name: "note")
  final String note;

  PassengerTransportationCreateModel({
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

  factory PassengerTransportationCreateModel.fromJson(
          Map<String, dynamic> json) =>
      _$PassengerTransportationCreateModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PassengerTransportationCreateModelToJson(this);
}

@JsonSerializable()
class DetailsModel {
  @JsonKey(name: "transportation_type_id")
  final int transportationTypeId;
  @JsonKey(name: "passenger_count")
  final int passengerCount;

  DetailsModel({
    required this.transportationTypeId,
    required this.passengerCount,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsModelToJson(this);
}
