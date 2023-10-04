import 'dart:async';

import 'package:flutter/material.dart';

import 'package:solid_software/src/app.dart';

void main() => runZonedGuarded(() async {
      runApp(const App());
    }, (error, stack) {});
