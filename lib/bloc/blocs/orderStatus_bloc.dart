// ignore_for_file: file_names

import 'dart:developer';

import 'package:agent_confirmation/api/api_repository.dart';
import 'package:agent_confirmation/bloc/events/user_event.dart';
import 'package:agent_confirmation/states/api_result.dart';
import 'package:agent_confirmation/states/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/call_session.dart';

class OrderStatusBloc extends Bloc<UserEvent, ResultState<CallSessionModel?>> {
  final ApiRepository apiRepository = ApiRepository();

  OrderStatusBloc() : super(const ResultState.idle()) {
    on<Distract>((event, emit) async => emit(const ResultState.idle()));
    on<Status>((event, emit) async => await _mapEventToState(event, emit));
  }

  Future<void> _mapEventToState(
      UserEvent event, Emitter<ResultState<CallSessionModel?>> emit) async {
    emit(const ResultState.loading());
    ApiResult<CallSessionModel?>? apiResult = const ApiResult.failure();
    if (event is Status) {
      log(" ====>>> change status event is dispatched  ");

      apiResult = await apiRepository.changeStatus(
          id: event.id,
          status: event.status,
          cancellationReason: event.cancellationReason,
          callBackReason: event.callBackReason,
          postponedDate: event.postponedDate,
          commune: event.commune,
          totalPrice: event.totalPrice,
          customerAddress: event.customerAddress,
          customerPhone: event.customerPhone,
          customerPhone2: event.customerPhone2,
          customerName: event.customerName,
          deliveryNote: event.deliveryNote,
          details: event.details);
    }

    await apiResult.when(
      success: (data) async {
        emit(ResultState.data(data: data));
      },
      failure: (error) async => emit(ResultState.error(error: error)),
    );
  }
}
