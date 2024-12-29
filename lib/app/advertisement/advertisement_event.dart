part of 'advertisement_bloc.dart';

sealed class AdvertisementEvent {}

class GetAdvertisementsEvent extends AdvertisementEvent {}

class GetAdvertisementsProvideEvent extends AdvertisementEvent {}

class GetAdvertisementsReceiveEvent extends AdvertisementEvent {}

class GetTransportationTypesEvent extends AdvertisementEvent {
  final int serviceId;

  GetTransportationTypesEvent({required this.serviceId});
}

class CreateDeliveryEvent extends AdvertisementEvent {
  final Map<String, dynamic> model;
  final VoidCallback onSucces;

  CreateDeliveryEvent({
    required this.model,
    required this.onSucces,
  });
}
