import 'package:agent_confirmation/api/api_repository.dart';
import 'package:agent_confirmation/bloc/events/user_event.dart';
import 'package:agent_confirmation/models/search_model.dart';
import 'package:agent_confirmation/states/api_result.dart';
import 'package:agent_confirmation/states/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<UserEvent, ResultState<SearchModel>> {
  final ApiRepository apiRepository = ApiRepository();

  SearchBloc() : super(const ResultState.idle()) {
    on<Distract>((event, emit) async => emit(const ResultState.idle()));
    on<Search>((event, emit) async => await _mapEventToState(event, emit));
  }

  Future<void> _mapEventToState(
      UserEvent event, Emitter<ResultState<SearchModel>> emit) async {
    emit(const ResultState.loading());
    ApiResult<SearchModel> apiResult =
        await apiRepository.searchKeyword((event as Search).searchKey);

    await apiResult.when(
      success: (data) async {
        emit(ResultState.data(data: data));
      },
      failure: (error) async => emit(ResultState.error(error: error)),
    );
  }
}
