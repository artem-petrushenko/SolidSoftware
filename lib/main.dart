import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:solid_software/src/app.dart';

void main() => runZonedGuarded(
      () async {
        // Ensure that the Flutter binding is initialized
        WidgetsFlutterBinding.ensureInitialized();
        final sharedPreferences = await SharedPreferences.getInstance();
        runApp(App(sharedPreferences: sharedPreferences));
      },
      // Define an error handler function that logs errors and their stack traces.
      (error, stack) => log(error.toString(), stackTrace: stack),
    );
