import 'package:json_annotation/json_annotation.dart';

part 'advertisement_model.g.dart';

@JsonSerializable()
class AdvertisementModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "adv_type")
  final String advType;
  @JsonKey(name: "shipment_date")
  final String? shipmentDate;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "service_type_id")
  final int serviceTypeId;
  @JsonKey(name: "service_name")
  final String? serviceName;
  @JsonKey(name: "from_location")
  final Location? fromLocation;
  @JsonKey(name: "to_location")
  final Location? toLocation;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "details")
  final Details? details;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "note")
  final String note;
  @JsonKey(name: "comments")
  final List<Comment>? comments;
  @JsonKey(name: "transport_name")
  final String? transportName;
  @JsonKey(name: "transport_icon")
  final String? transportIcon;
  @JsonKey(name: "created_by_name")
  final String? createdByName;
  @JsonKey(name: "created_by_phone")
  final String? createdByPhone;
  @JsonKey(name: "created_by_tg_link")
  final String? createdByTgLink;
  @JsonKey(name: "workshop_services")
  final List<String>? workshopServices;
  @JsonKey(name: "workshop_categories")
  final List<String>? workshopCategories;
  @JsonKey(name: "car_name")
  final String? carName;

  AdvertisementModel({
    required this.id,
    required this.advType,
    required this.shipmentDate,
    required this.status,
    required this.serviceTypeId,
    required this.serviceName,
    required this.fromLocation,
    required this.toLocation,
    required this.price,
    required this.details,
    required this.images,
    this.note = "",
    required this.comments,
    required this.transportName,
    required this.transportIcon,
    required this.createdByName,
    required this.createdByPhone,
    required this.createdByTgLink,
    required this.workshopServices,
    required this.workshopCategories,
    required this.carName,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);
}

@JsonSerializable()
class Comment {
  @JsonKey(name: "rating")
  final int rating;
  @JsonKey(name: "comment_text")
  final String commentText;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "created_by")
  final String createdBy;

  Comment({
    required this.rating,
    required this.commentText,
    required this.createdAt,
    required this.createdBy,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: "transportation_type_id")
  final int? transportationTypeId;
  @JsonKey(name: "load_weight")
  final LoadWeight? loadWeight;
  @JsonKey(name: "passenger_count")
  final int? passengerCount;
  @JsonKey(name: "transport_type_id")
  final int? transportTypeId;
  @JsonKey(name: "characteristics")
  final Characteristics? characteristics;
  @JsonKey(name: "tariffs")
  final List<Tariff>? tariffs;
  @JsonKey(name: "repair_type_id")
  final int? repairTypeId;
  // @JsonKey(name: "category")
  // final List<String>? category;
  // @JsonKey(name: "services")
  // final List<int>? services;
  @JsonKey(name: "company_name")
  final String? companyName;
  @JsonKey(name: "transport_specialist_id")
  final int? transportSpecialistId;
  @JsonKey(name: "specialist_first_name")
  final String? specialistFirstName;
  @JsonKey(name: "specialist_last_name")
  final String? specialistLastName;
  @JsonKey(name: "transport_count")
  final int? transportCount;
  @JsonKey(name: "area")
  final String? area;
  @JsonKey(name: "load_type_id")
  final String? loadTypeId;
  @JsonKey(name: "load_service_id")
  final String? loadServiceId;
  @JsonKey(name: "fuel_amount")
  final int? fuelAmount;
  @JsonKey(name: "fuel_type_id")
  final int? fuelTypeId;
  @JsonKey(name: "advertisement_id")
  final int? advertisementId;
  @JsonKey(name: "from_date")
  final String? fromDate;
  @JsonKey(name: "to_date")
  final String? toDate;
  @JsonKey(name: "fuels")
  final List<Fuel>? fuels;

  Details({
    this.transportationTypeId,
    this.loadWeight,
    this.passengerCount,
    this.transportTypeId,
    this.characteristics,
    this.tariffs,
    this.repairTypeId,
    // this.category,
    // this.services,
    this.companyName,
    this.transportSpecialistId,
    this.specialistFirstName,
    this.specialistLastName,
    this.transportCount,
    this.area,
    this.loadTypeId,
    this.loadServiceId,
    this.fuelAmount,
    this.fuelTypeId,
    this.advertisementId,
    this.fromDate,
    this.toDate,
    this.fuels,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class Characteristics {
  @JsonKey(name: "model_id")
  final int modelId;
  @JsonKey(name: "vehicle_body_id")
  final int vehicleBodyId;
  @JsonKey(name: "transmission")
  final int transmission;
  @JsonKey(name: "engine_capacity")
  final double engineCapacity;
  @JsonKey(name: "colour_id")
  final int colourId;
  @JsonKey(name: "trunk_capacity")
  final double trunkCapacity;
  @JsonKey(name: "passenger_count")
  final int passengerCount;
  @JsonKey(name: "has_air_conditioner")
  final bool hasAirConditioner;
  @JsonKey(name: "has_insurance")
  final bool hasInsurance;
  @JsonKey(name: "daily_distance_limit")
  final int dailyDistanceLimit;
  @JsonKey(name: "deposit_amount")
  final int depositAmount;

  Characteristics({
    required this.modelId,
    required this.vehicleBodyId,
    required this.transmission,
    required this.engineCapacity,
    required this.colourId,
    required this.trunkCapacity,
    required this.passengerCount,
    required this.hasAirConditioner,
    required this.hasInsurance,
    required this.dailyDistanceLimit,
    required this.depositAmount,
  });

  factory Characteristics.fromJson(Map<String, dynamic> json) =>
      _$CharacteristicsFromJson(json);

  Map<String, dynamic> toJson() => _$CharacteristicsToJson(this);
}

@JsonSerializable()
class Fuel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "price")
  final String price;

  Fuel({
    required this.id,
    required this.type,
    required this.price,
  });

  factory Fuel.fromJson(Map<String, dynamic> json) => _$FuelFromJson(json);

  Map<String, dynamic> toJson() => _$FuelToJson(this);
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
class Tariff {
  @JsonKey(name: "day")
  final int day;
  @JsonKey(name: "price")
  final int price;

  Tariff({
    required this.day,
    required this.price,
  });

  factory Tariff.fromJson(Map<String, dynamic> json) => _$TariffFromJson(json);

  Map<String, dynamic> toJson() => _$TariffToJson(this);
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
