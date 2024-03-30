// ignore_for_file: library_prefixes

import 'package:agent_confirmation/bloc/blocs/callSession_bloc.dart';
import 'package:agent_confirmation/bloc/blocs/login_bloc.dart';
import 'package:agent_confirmation/bloc/blocs/produc_bloc.dart';
import 'package:agent_confirmation/bloc/blocs/update_views_cubit.dart';
import 'package:agent_confirmation/bloc/blocs/wilaya_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs/communes_bloc.dart';
import '../bloc/blocs/orderStatus_bloc.dart';
import '../bloc/blocs/search_bloc.dart';

List<BlocProvider> getProvidersArray(BuildContext context) {
  return [
    BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
    ),
    BlocProvider<CallSessionBloc>(
      lazy:
          false, 
      create: (BuildContext context) => CallSessionBloc(),
    ),
    BlocProvider<UpdateViewsCubit>(
      create: (BuildContext context) => UpdateViewsCubit(),
    ),
    BlocProvider<CommuneBloc>(
      create: (BuildContext context) => CommuneBloc(),
    ),
    BlocProvider<SearchBloc>(
      create: (BuildContext context) => SearchBloc(),
    ),
    BlocProvider<OrderStatusBloc>(
      lazy: false,
      create: (BuildContext context) => OrderStatusBloc(),
    ),
    BlocProvider<WilayaBloc>(
      create: (BuildContext context) => WilayaBloc(),
    ),
    BlocProvider<ProductBloc>(create: (BuildContext context) => ProductBloc()),
  ];
}
