// ignore_for_file: library_prefixes

import 'dart:io';

import 'package:agent_confirmation/models/abortReasons_model.dart';
import 'package:agent_confirmation/models/callBackReason_model.dart';
import 'package:agent_confirmation/models/call_session.dart';
import 'package:agent_confirmation/models/commune_model.dart';
import 'package:agent_confirmation/models/data_model.dart';
import 'package:agent_confirmation/models/product_model.dart';
import 'package:agent_confirmation/models/search_object.dart';
import 'package:agent_confirmation/models/stats_model.dart';
import 'package:agent_confirmation/models/store_model.dart';
import 'package:agent_confirmation/models/user_picture.dart';
import 'package:agent_confirmation/models/wilaya_model.dart';
import 'package:agent_confirmation/pages/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:easy_localization/easy_localization.dart' as localized;
import 'constantes/bloc_providers.dart';
import 'converters/jiffy_hive_converter.dart';
import 'models/auth_token.dart';
import 'models/user_model.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jiffy/jiffy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(AuthTokenAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(StatsModelAdapter());
  Hive.registerAdapter(JiffyAdapter());
  Hive.registerAdapter(UserPictureAdapter());
  Hive.registerAdapter(CallSessionModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(StoreModelAdapter());
  Hive.registerAdapter(WilayaModelAdapter());
  Hive.registerAdapter(CommuneModelAdapter());
  Hive.registerAdapter(CallBackReasonModelAdapter());
  Hive.registerAdapter(AbortReasonsModelAdapter());
  Hive.registerAdapter(SearchObjectAdapter());
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<UserModel>('UserModel');
  await Hive.openBox<UserPicture>('UserPicture');
  await Hive.openBox<DataModel>('DataModel');
  await localized.EasyLocalization.ensureInitialized();

  await Jiffy.locale('fr');

  runApp(
    Phoenix(
      child: localized.EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('fr'), Locale('ar')],
        startLocale: const Locale('fr'),
        path: 'assets/translations',
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getProvidersArray(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
