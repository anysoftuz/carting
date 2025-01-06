// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertisementModel _$AdvertisementModelFromJson(Map<String, dynamic> json) =>
    AdvertisementModel(
      id: (json['id'] as num).toInt(),
      advType: json['adv_type'] as String,
      shipmentDate: json['shipment_date'] as String?,
      status: json['status'] as String,
      serviceTypeId: (json['service_type_id'] as num).toInt(),
      serviceName: json['service_name'] as String?,
      fromLocation: json['from_location'] == null
          ? null
          : Location.fromJson(json['from_location'] as Map<String, dynamic>),
      toLocation: json['to_location'] == null
          ? null
          : Location.fromJson(json['to_location'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      note: json['note'] as String? ?? "",
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      transportName: json['transport_name'] as String?,
      transportIcon: json['transport_icon'] as String?,
      createdByName: json['created_by_name'] as String?,
      createdByPhone: json['created_by_phone'] as String?,
      createdByTgLink: json['created_by_tg_link'] as String?,
      workshopServices: (json['workshop_services'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workshopCategories: (json['workshop_categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      carName: json['car_name'] as String?,
    );

Map<String, dynamic> _$AdvertisementModelToJson(AdvertisementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adv_type': instance.advType,
      'shipment_date': instance.shipmentDate,
      'status': instance.status,
      'service_type_id': instance.serviceTypeId,
      'service_name': instance.serviceName,
      'from_location': instance.fromLocation,
      'to_location': instance.toLocation,
      'price': instance.price,
      'details': instance.details,
      'images': instance.images,
      'note': instance.note,
      'comments': instance.comments,
      'transport_name': instance.transportName,
      'transport_icon': instance.transportIcon,
      'created_by_name': instance.createdByName,
      'created_by_phone': instance.createdByPhone,
      'created_by_tg_link': instance.createdByTgLink,
      'workshop_services': instance.workshopServices,
      'workshop_categories': instance.workshopCategories,
      'car_name': instance.carName,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      rating: (json['rating'] as num).toInt(),
      commentText: json['comment_text'] as String,
      createdAt: json['created_at'] as String,
      createdBy: json['created_by'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'rating': instance.rating,
      'comment_text': instance.commentText,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      transportationTypeId: (json['transportation_type_id'] as num?)?.toInt(),
      loadWeight: json['load_weight'] == null
          ? null
          : LoadWeight.fromJson(json['load_weight'] as Map<String, dynamic>),
      passengerCount: (json['passenger_count'] as num?)?.toInt(),
      transportTypeId: (json['transport_type_id'] as num?)?.toInt(),
      characteristics: json['characteristics'] == null
          ? null
          : Characteristics.fromJson(
              json['characteristics'] as Map<String, dynamic>),
      tariffs: (json['tariffs'] as List<dynamic>?)
          ?.map((e) => Tariff.fromJson(e as Map<String, dynamic>))
          .toList(),
      repairTypeId: (json['repair_type_id'] as num?)?.toInt(),
      companyName: json['company_name'] as String?,
      transportSpecialistId: (json['transport_specialist_id'] as num?)?.toInt(),
      specialistFirstName: json['specialist_first_name'] as String?,
      specialistLastName: json['specialist_last_name'] as String?,
      transportCount: (json['transport_count'] as num?)?.toInt(),
      area: json['area'] as String?,
      loadTypeId: json['load_type_id'] as String?,
      loadServiceId: json['load_service_id'] as String?,
      fuelAmount: (json['fuel_amount'] as num?)?.toInt(),
      fuelTypeId: (json['fuel_type_id'] as num?)?.toInt(),
      advertisementId: (json['advertisement_id'] as num?)?.toInt(),
      fromDate: json['from_date'] as String?,
      toDate: json['to_date'] as String?,
      fuels: (json['fuels'] as List<dynamic>?)
          ?.map((e) => Fuel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'transportation_type_id': instance.transportationTypeId,
      'load_weight': instance.loadWeight,
      'passenger_count': instance.passengerCount,
      'transport_type_id': instance.transportTypeId,
      'characteristics': instance.characteristics,
      'tariffs': instance.tariffs,
      'repair_type_id': instance.repairTypeId,
      'company_name': instance.companyName,
      'transport_specialist_id': instance.transportSpecialistId,
      'specialist_first_name': instance.specialistFirstName,
      'specialist_last_name': instance.specialistLastName,
      'transport_count': instance.transportCount,
      'area': instance.area,
      'load_type_id': instance.loadTypeId,
      'load_service_id': instance.loadServiceId,
      'fuel_amount': instance.fuelAmount,
      'fuel_type_id': instance.fuelTypeId,
      'advertisement_id': instance.advertisementId,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'fuels': instance.fuels,
    };

Characteristics _$CharacteristicsFromJson(Map<String, dynamic> json) =>
    Characteristics(
      modelId: (json['model_id'] as num).toInt(),
      vehicleBodyId: (json['vehicle_body_id'] as num).toInt(),
      transmission: (json['transmission'] as num).toInt(),
      engineCapacity: (json['engine_capacity'] as num).toDouble(),
      colourId: (json['colour_id'] as num).toInt(),
      trunkCapacity: (json['trunk_capacity'] as num).toDouble(),
      passengerCount: (json['passenger_count'] as num).toInt(),
      hasAirConditioner: json['has_air_conditioner'] as bool,
      hasInsurance: json['has_insurance'] as bool,
      dailyDistanceLimit: (json['daily_distance_limit'] as num).toInt(),
      depositAmount: (json['deposit_amount'] as num).toInt(),
    );

Map<String, dynamic> _$CharacteristicsToJson(Characteristics instance) =>
    <String, dynamic>{
      'model_id': instance.modelId,
      'vehicle_body_id': instance.vehicleBodyId,
      'transmission': instance.transmission,
      'engine_capacity': instance.engineCapacity,
      'colour_id': instance.colourId,
      'trunk_capacity': instance.trunkCapacity,
      'passenger_count': instance.passengerCount,
      'has_air_conditioner': instance.hasAirConditioner,
      'has_insurance': instance.hasInsurance,
      'daily_distance_limit': instance.dailyDistanceLimit,
      'deposit_amount': instance.depositAmount,
    };

Fuel _$FuelFromJson(Map<String, dynamic> json) => Fuel(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$FuelToJson(Fuel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'price': instance.price,
    };

LoadWeight _$LoadWeightFromJson(Map<String, dynamic> json) => LoadWeight(
      amount: (json['amount'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$LoadWeightToJson(LoadWeight instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'name': instance.name,
    };

Tariff _$TariffFromJson(Map<String, dynamic> json) => Tariff(
      day: (json['day'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$TariffToJson(Tariff instance) => <String, dynamic>{
      'day': instance.day,
      'price': instance.price,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
    };
