part of 'advertisement_bloc.dart';

sealed class AdvertisementEvent {}

class GetAdvertisementsEvent extends AdvertisementEvent {}

class GetAdvertisementsProvideEvent extends AdvertisementEvent {}

class GetAdvertisementsReceiveEvent extends AdvertisementEvent {}

class GetCarsEvent extends AdvertisementEvent {}

class GetFuelsEvent extends AdvertisementEvent {
  final int id;

  GetFuelsEvent({required this.id});
}

class GetTransportationTypesEvent extends AdvertisementEvent {
  final int serviceId;
  final bool isRECEIVE;

  GetTransportationTypesEvent({
    required this.serviceId,
    this.isRECEIVE = false,
  });
}

class CreateDeliveryEvent extends AdvertisementEvent {
  final Map<String, dynamic> model;
  final VoidCallback onSucces;

  CreateDeliveryEvent({
    required this.model,
    required this.onSucces,
  });
}


class DeactivetEvent extends AdvertisementEvent {
  final int id;

  DeactivetEvent({required this.id});
}