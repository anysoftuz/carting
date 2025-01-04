import 'package:json_annotation/json_annotation.dart';

part 'servis_model.g.dart';

@JsonSerializable()
class ServisModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  ServisModel({
    required this.id,
    required this.name,
  });

  factory ServisModel.fromJson(Map<String, dynamic> json) =>
      _$ServisModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServisModelToJson(this);
}
