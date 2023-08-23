// ignore_for_file: file_names
import 'package:agent_confirmation/bloc/events/user_event.dart';
import 'package:agent_confirmation/models/wilaya_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api_repository.dart';
import '../../states/api_result.dart';
//import '../../states/network_exceptions.dart';
import '../../states/result_state.dart';

class WilayaBloc extends Bloc<UserEvent, ResultState<List<WilayaModel>>> {
  final ApiRepository apiRepository = ApiRepository();

  WilayaBloc() : super(const ResultState.idle()) {
    on<Distract>((event, emit) async => emit(const ResultState.idle()));
    on<Wilaya>((event, emit) async => await _mapEventToState(event, emit));
  }

  Future<void> _mapEventToState(
      UserEvent event, Emitter<ResultState<List<WilayaModel>>> emit) async {
    emit(const ResultState.loading());

    ApiResult<List<WilayaModel>> apiResult = await apiRepository.getWilayas();

    await apiResult.when(
      success: (data) async {
        emit(ResultState.data(data: data));
      },
      failure: (error) async => emit(ResultState.error(error: error)),
    );
  }
}
