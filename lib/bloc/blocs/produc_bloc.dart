// ignore_for_file: file_names
import 'package:agent_confirmation/bloc/events/user_event.dart';
import 'package:agent_confirmation/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api_repository.dart';
import '../../states/api_result.dart';
//import '../../states/network_exceptions.dart';
import '../../states/result_state.dart';

class ProductBloc extends Bloc<UserEvent, ResultState<List<ProductModel>>> {
  final ApiRepository apiRepository = ApiRepository();

  ProductBloc() : super(const ResultState.idle()) {
    on<Distract>((event, emit) async => emit(const ResultState.idle()));
    on<Product>((event, emit) async => await _mapEventToState(event, emit));
  }

  Future<void> _mapEventToState(
      UserEvent event, Emitter<ResultState<List<ProductModel>>> emit) async {
    emit(const ResultState.loading());

    ApiResult<List<ProductModel>> apiResult = await apiRepository
        .getStoreProducts((event as Product).id, (event).name);

    await apiResult.when(
      success: (data) async {
        emit(ResultState.data(data: data));
      },
      failure: (error) async => emit(ResultState.error(error: error)),
    );
  }
}
