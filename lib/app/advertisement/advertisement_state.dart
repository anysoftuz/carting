// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'advertisement_bloc.dart';

class AdvertisementState extends Equatable {
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus statusFuels;
  final FormzSubmissionStatus statusPROVIDE;
  final FormzSubmissionStatus statusRECEIVE;
  final FormzSubmissionStatus statusTrTypes;
  final FormzSubmissionStatus statusCreate;
  final FormzSubmissionStatus statusCars;
  final List<AdvertisementModel> advertisement;
  final List<AdvertisementModel> advertisementRECEIVE;
  final List<AdvertisementModel> advertisementPROVIDE;
  final List<TransportationTypesModel> transportationTypes;
  final List<FuelsInfoModel> fuelsModel;
  final List<CarsModel> carsModel;
  const AdvertisementState({
    this.status = FormzSubmissionStatus.initial,
    this.statusPROVIDE = FormzSubmissionStatus.initial,
    this.statusRECEIVE = FormzSubmissionStatus.initial,
    this.statusTrTypes = FormzSubmissionStatus.initial,
    this.statusCreate = FormzSubmissionStatus.initial,
    this.statusFuels = FormzSubmissionStatus.initial,
    this.statusCars = FormzSubmissionStatus.initial,
    this.fuelsModel = const [],
    this.transportationTypes = const [],
    this.advertisement = const [],
    this.advertisementRECEIVE = const [],
    this.advertisementPROVIDE = const [],
    this.carsModel = const [],
  });

  @override
  List<Object> get props => [
        status,
        statusPROVIDE,
        statusRECEIVE,
        statusTrTypes,
        statusCreate,
        statusFuels,
        statusCars,
        fuelsModel,
        transportationTypes,
        advertisement,
        advertisementRECEIVE,
        advertisementPROVIDE,
        carsModel
      ];

  AdvertisementState copyWith({
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? statusFuels,
    FormzSubmissionStatus? statusPROVIDE,
    FormzSubmissionStatus? statusRECEIVE,
    FormzSubmissionStatus? statusTrTypes,
    FormzSubmissionStatus? statusCreate,
    FormzSubmissionStatus? statusCars,
    List<AdvertisementModel>? advertisement,
    List<AdvertisementModel>? advertisementRECEIVE,
    List<AdvertisementModel>? advertisementPROVIDE,
    List<TransportationTypesModel>? transportationTypes,
    List<FuelsInfoModel>? fuelsModel,
    List<CarsModel>? carsModel,
  }) {
    return AdvertisementState(
      status: status ?? this.status,
      statusFuels: statusFuels ?? this.statusFuels,
      statusPROVIDE: statusPROVIDE ?? this.statusPROVIDE,
      statusRECEIVE: statusRECEIVE ?? this.statusRECEIVE,
      statusTrTypes: statusTrTypes ?? this.statusTrTypes,
      statusCreate: statusCreate ?? this.statusCreate,
      statusCars: statusCars ?? this.statusCars,
      advertisement: advertisement ?? this.advertisement,
      advertisementRECEIVE: advertisementRECEIVE ?? this.advertisementRECEIVE,
      advertisementPROVIDE: advertisementPROVIDE ?? this.advertisementPROVIDE,
      transportationTypes: transportationTypes ?? this.transportationTypes,
      fuelsModel: fuelsModel ?? this.fuelsModel,
      carsModel: carsModel ?? this.carsModel,
    );
  }
}
