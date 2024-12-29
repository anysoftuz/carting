import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/data/models/transportation_types_model.dart';
import 'package:carting/infrastructure/repo/advertisement_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'advertisement_event.dart';
part 'advertisement_state.dart';

class AdvertisementBloc extends Bloc<AdvertisementEvent, AdvertisementState> {
  final AdvertisementRepo _repo;
  AdvertisementBloc(this._repo) : super(const AdvertisementState()) {
    on<CreateDeliveryEvent>((event, emit) async {
      emit(state.copyWith(statusCreate: FormzSubmissionStatus.inProgress));
      final respons = await _repo.createAdvertisement(event.model);
      if (respons.isRight) {
        emit(state.copyWith(statusCreate: FormzSubmissionStatus.success));
        event.onSucces();
        add(GetAdvertisementsProvideEvent());
        add(GetAdvertisementsReceiveEvent());
      } else {
        emit(state.copyWith(statusCreate: FormzSubmissionStatus.failure));
      }
    });

    on<GetTransportationTypesEvent>((event, emit) async {
      emit(state.copyWith(statusTrTypes: FormzSubmissionStatus.inProgress));
      final respons = await _repo.getTransportationTypes(event.serviceId);
      if (respons.isRight) {
        emit(state.copyWith(
          statusTrTypes: FormzSubmissionStatus.success,
          transportationTypes: respons.right.data,
        ));
      } else {
        emit(state.copyWith(statusTrTypes: FormzSubmissionStatus.failure));
      }
    });

    on<GetAdvertisementsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final respons = await _repo.getAdvertisements();
      if (respons.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          advertisement: respons.right.data,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });

    on<GetAdvertisementsProvideEvent>((event, emit) async {
      emit(state.copyWith(statusPROVIDE: FormzSubmissionStatus.inProgress));
      final respons = await _repo.getAdvertisementsMe(true);
      if (respons.isRight) {
        emit(state.copyWith(
          statusPROVIDE: FormzSubmissionStatus.success,
          advertisementPROVIDE: respons.right.data,
        ));
      } else {
        emit(state.copyWith(statusPROVIDE: FormzSubmissionStatus.failure));
      }
    });

    on<GetAdvertisementsReceiveEvent>((event, emit) async {
      emit(state.copyWith(statusRECEIVE: FormzSubmissionStatus.inProgress));
      final respons = await _repo.getAdvertisementsMe(false);
      if (respons.isRight) {
        emit(state.copyWith(
          statusRECEIVE: FormzSubmissionStatus.success,
          advertisementRECEIVE: respons.right.data,
        ));
      } else {
        emit(state.copyWith(statusRECEIVE: FormzSubmissionStatus.failure));
      }
    });
  }
}
