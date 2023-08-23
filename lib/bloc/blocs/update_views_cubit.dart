import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:agent_confirmation/api/api_repository.dart';

class UpdateViewsCubit extends Cubit<int> {
  final ApiRepository apiRepository = ApiRepository();

  UpdateViewsCubit() : super(0);

  void updateState() => emit(state + 1);
  void goToState() => emit(state);
  void initState() => emit(0);
}
