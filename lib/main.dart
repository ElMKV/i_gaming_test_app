import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:i_gaming_test_app/app.dart';
import 'package:i_gaming_test_app/blocs/app_flow/app_flow_cubit.dart';
import 'package:i_gaming_test_app/core/storage/subscription_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final storage = SharedPreferencesSubscriptionStorage(prefs);

  runApp(
    BlocProvider(
      create: (_) => AppFlowCubit(storage)..bootstrap(),
      child: const App(),
    ),
  );
}
