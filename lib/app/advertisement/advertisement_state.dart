// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'advertisement_bloc.dart';

class AdvertisementState extends Equatable {
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus statusPROVIDE;
  final FormzSubmissionStatus statusRECEIVE;
  final List<AdvertisementModel> advertisement;
  final List<AdvertisementModel> advertisementRECEIVE;
  final List<AdvertisementModel> advertisementPROVIDE;
  const AdvertisementState({
    this.status = FormzSubmissionStatus.initial,
    this.statusPROVIDE = FormzSubmissionStatus.initial,
    this.statusRECEIVE = FormzSubmissionStatus.initial,
    this.advertisement = const [],
    this.advertisementRECEIVE = const [],
    this.advertisementPROVIDE = const [],
  });

  @override
  List<Object> get props => [
        status,
        statusPROVIDE,
        statusRECEIVE,
        advertisement,
        advertisementRECEIVE,
        advertisementPROVIDE,
      ];

  AdvertisementState copyWith({
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? statusPROVIDE,
    FormzSubmissionStatus? statusRECEIVE,
    List<AdvertisementModel>? advertisement,
    List<AdvertisementModel>? advertisementRECEIVE,
    List<AdvertisementModel>? advertisementPROVIDE,
  }) {
    return AdvertisementState(
      status: status ?? this.status,
      statusPROVIDE: statusPROVIDE ?? this.statusPROVIDE,
      statusRECEIVE: statusRECEIVE ?? this.statusRECEIVE,
      advertisement: advertisement ?? this.advertisement,
      advertisementRECEIVE: advertisementRECEIVE ?? this.advertisementRECEIVE,
      advertisementPROVIDE: advertisementPROVIDE ?? this.advertisementPROVIDE,
    );
  }
}
