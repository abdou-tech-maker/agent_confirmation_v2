import 'dart:developer';

import 'package:agent_confirmation/api/api_repository.dart';
import 'package:agent_confirmation/bloc/events/user_event.dart';
import 'package:agent_confirmation/models/auth_token.dart';
import 'package:agent_confirmation/states/api_result.dart';
import 'package:agent_confirmation/states/network_exceptions.dart';
import 'package:agent_confirmation/states/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';

class LoginBloc extends Bloc<UserEvent, ResultState<Map<String, dynamic>>> {
  final ApiRepository apiRepository = ApiRepository();

  LoginBloc() : super(const ResultState.idle()) {
    on<Distract>((event, emit) async => emit(const ResultState.idle()));
    on<Login>((event, emit) async => await _mapEventToState(event, emit));
  }

  Future<void> _mapEventToState(
      UserEvent event, Emitter<ResultState<Map<String, dynamic>>> emit) async {
    emit(const ResultState.loading());
    ApiResult<Map<String, dynamic>> apiResult = const ApiResult.failure();
    if (event is Login) {
      apiResult = await apiRepository.login(event.username, event.password);
    }

    await apiResult.when(
      success: (data) async {
        await AuthToken.setToken(data!['auth_token'], "", 0, "");
        final token = await AuthToken.getToken();
        final user = UserModel(
          id: data['user_id'],
          username: data['username'],
          fullname: data['full_name'],
          phone: data['phone'],
          role: data['role'],
        );
        // ignore: unnecessary_null_comparison
        if (user != null) {
          await UserModel.set(user);
          log("this is the user model ${user.toJson()}");
          log("this is the auth token ${token.toString()}");
          emit(ResultState.data(data: data));
        } else {
          emit(const ResultState.error(
              error: NetworkExceptions.unexpectedError()));
        }
      },
      failure: (error) async => emit(ResultState.error(error: error)),
    );
  }
}
