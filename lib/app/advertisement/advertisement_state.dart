// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'advertisement_bloc.dart';

class AdvertisementState extends Equatable {
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus statusFuels;
  final FormzSubmissionStatus statusPROVIDE;
  final FormzSubmissionStatus statusRECEIVE;
  final FormzSubmissionStatus statusFilter;
  final FormzSubmissionStatus statusTrTypes;
  final FormzSubmissionStatus statusCreate;
  final FormzSubmissionStatus statusCars;
  final FormzSubmissionStatus statusCategory;
  final FormzSubmissionStatus statusServices;
  final FormzSubmissionStatus statusChange;
  final List<AdvertisementModel> advertisement;
  final List<AdvertisementModel> advertisementFilter;
  final List<AdvertisementModel> advertisementRECEIVE;
  final List<AdvertisementModel> advertisementPROVIDE;
  final List<TransportationTypesModel> transportationTypes;
  final List<FuelsInfoModel> fuelsModel;
  final List<CarsModel> carsModel;
  final List<TransportSpecialistsModel> transportSpecialists;
  final List<ServisModel> categoriesList;
  final List<ServisModel> servicesList;
  const AdvertisementState({
    this.status = FormzSubmissionStatus.initial,
    this.statusPROVIDE = FormzSubmissionStatus.initial,
    this.statusRECEIVE = FormzSubmissionStatus.initial,
    this.statusTrTypes = FormzSubmissionStatus.initial,
    this.statusCreate = FormzSubmissionStatus.initial,
    this.statusFuels = FormzSubmissionStatus.initial,
    this.statusCars = FormzSubmissionStatus.initial,
    this.statusFilter = FormzSubmissionStatus.initial,
    this.statusCategory = FormzSubmissionStatus.initial,
    this.statusServices = FormzSubmissionStatus.initial,
    this.statusChange = FormzSubmissionStatus.initial,
    this.fuelsModel = const [],
    this.advertisementFilter = const [],
    this.transportationTypes = const [],
    this.advertisement = const [],
    this.advertisementRECEIVE = const [],
    this.advertisementPROVIDE = const [],
    this.carsModel = const [],
    this.transportSpecialists = const [],
    this.categoriesList = const [],
    this.servicesList = const [],
  });

  @override
  List<Object> get props => [
        status,
        statusPROVIDE,
        statusRECEIVE,
        statusFilter,
        advertisementFilter,
        statusTrTypes,
        statusCreate,
        statusFuels,
        statusChange,
        statusCars,
        fuelsModel,
        transportationTypes,
        advertisement,
        advertisementRECEIVE,
        advertisementPROVIDE,
        carsModel,
        transportSpecialists,
        statusCategory,
        statusServices,
        categoriesList,
        servicesList
      ];

  AdvertisementState copyWith({
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? statusFuels,
    FormzSubmissionStatus? statusPROVIDE,
    FormzSubmissionStatus? statusRECEIVE,
    FormzSubmissionStatus? statusFilter,
    FormzSubmissionStatus? statusTrTypes,
    FormzSubmissionStatus? statusCreate,
    FormzSubmissionStatus? statusCars,
    FormzSubmissionStatus? statusCategory,
    FormzSubmissionStatus? statusServices,
    FormzSubmissionStatus? statusChange,
    List<AdvertisementModel>? advertisement,
    List<AdvertisementModel>? advertisementFilter,
    List<AdvertisementModel>? advertisementRECEIVE,
    List<AdvertisementModel>? advertisementPROVIDE,
    List<TransportationTypesModel>? transportationTypes,
    List<FuelsInfoModel>? fuelsModel,
    List<CarsModel>? carsModel,
    List<TransportSpecialistsModel>? transportSpecialists,
    List<ServisModel>? categoriesList,
    List<ServisModel>? servicesList,
  }) {
    return AdvertisementState(
      status: status ?? this.status,
      statusFuels: statusFuels ?? this.statusFuels,
      statusPROVIDE: statusPROVIDE ?? this.statusPROVIDE,
      statusRECEIVE: statusRECEIVE ?? this.statusRECEIVE,
      statusFilter: statusFilter ?? this.statusFilter,
      statusTrTypes: statusTrTypes ?? this.statusTrTypes,
      statusCreate: statusCreate ?? this.statusCreate,
      statusCars: statusCars ?? this.statusCars,
      statusCategory: statusCategory ?? this.statusCategory,
      statusServices: statusServices ?? this.statusServices,
      statusChange: statusChange ?? this.statusChange,
      advertisement: advertisement ?? this.advertisement,
      advertisementFilter: advertisementFilter ?? this.advertisementFilter,
      advertisementRECEIVE: advertisementRECEIVE ?? this.advertisementRECEIVE,
      advertisementPROVIDE: advertisementPROVIDE ?? this.advertisementPROVIDE,
      transportationTypes: transportationTypes ?? this.transportationTypes,
      fuelsModel: fuelsModel ?? this.fuelsModel,
      carsModel: carsModel ?? this.carsModel,
      transportSpecialists: transportSpecialists ?? this.transportSpecialists,
      categoriesList: categoriesList ?? this.categoriesList,
      servicesList: servicesList ?? this.servicesList,
    );
  }
}
