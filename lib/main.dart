import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:solid_software/src/app.dart';

void main() => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        final sharedPreferences = await SharedPreferences.getInstance();
        runApp(App(sharedPreferences: sharedPreferences));
      },
      (error, stack) {
        log(error.toString());
      },
    );
