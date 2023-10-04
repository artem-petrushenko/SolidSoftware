import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:solid_software/src/feature/rainbow/widget/rainbow_view.dart';

import 'package:solid_software/src/feature/rainbow/bloc/rainbow_bloc.dart';

import 'package:solid_software/src/feature/rainbow/data/client/shared_preferences_manager.dart';
import 'package:solid_software/src/feature/rainbow/data/provider/local/rainbow_storage_impl.dart';
import 'package:solid_software/src/feature/rainbow/data/repository/rainbow_repository_impl.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software',
      home: BlocProvider(
        create: (BuildContext context) {
          return RainbowBloc(
            rainbowRepository: RainbowRepositoryImpl(
              rainbowStorage: RainbowStorageImpl(
                sharedPreferencesManager: SharedPreferencesManager(
                    sharedPreferences: _sharedPreferences),
              ),
            ),
          )..add(const RainbowEvent.fetchColors());
        },
        child: const RainbowView(),
      ),
    );
  }
}
