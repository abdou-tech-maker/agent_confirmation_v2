// ignore_for_file: file_names
import 'dart:developer';

import 'package:agent_confirmation/bloc/events/user_event.dart';
import 'package:agent_confirmation/models/call_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api_repository.dart';
import '../../states/api_result.dart';
//import '../../states/network_exceptions.dart';
import '../../states/result_state.dart';

class CallSessionBloc extends Bloc<UserEvent, ResultState<CallSessionModel?>?> {
  final ApiRepository apiRepository = ApiRepository();
  /* CallSessionModel updatedModel = CallSessionModel(
      wilaya: null,
      cancellationReason: null,
      callbackReason: null,
      cancelledAt: '',
      cofirmedAt: '',
      commune: null,
      customerAddress: '',
      customerName: '',
      customerPhone: '',
      customerPhone2: '',
      details: const [],
      displayId: null,
      id: '',
      noteToDriver: '',
      postponedTo: '',
      status: null,
      store: null,
      totalPrice: null,
      uploadCommune: '',
      uploadWilaya: '');*/

  CallSessionBloc() : super(const ResultState.idle()) {
    on<Distract>((event, emit) async => emit(const ResultState.idle()));
    on<Call>((event, emit) async => await _mapEventToState(event, emit));
  }
  Future<void> _mapEventToState(
      UserEvent event, Emitter<ResultState<CallSessionModel?>?> emit) async {
    emit(const ResultState.loading());
    log(" ====>>> event is dispatched  ");
    ApiResult<CallSessionModel?>? apiResult =
        (await apiRepository.getCallSession());

    await apiResult?.when(
      success: (data) async {
        emit(ResultState.data(data: data));
      },
      failure: (error) async => emit(ResultState.error(error: error)),
    );
  }

  /*void updateString(String newValue) {
    updatedModel = updatedModel.copyWith(field1: newValue);
  }*/
}
