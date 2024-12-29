import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lng")
  final double lng;
  @JsonKey(name: "name")
  final String name;

  LocationModel({
    required this.lat,
    required this.lng,
    required this.name,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
