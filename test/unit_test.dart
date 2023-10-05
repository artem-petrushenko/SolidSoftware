import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:solid_software/src/feature/rainbow/data/client/shared_preferences_manager.dart';
import 'package:solid_software/src/feature/rainbow/data/provider/local/rainbow_storage.dart';
import 'package:solid_software/src/feature/rainbow/data/provider/local/rainbow_storage_impl.dart';
import 'package:solid_software/src/feature/rainbow/data/repository/rainbow_repository_impl.dart';

void main() => group('Unit Tests', () {
      SharedPreferences.setMockInitialValues({});
      late final SharedPreferences sharedPreferences;
      late final SharedPreferencesManager sharedPreferencesManager;
      late final RainbowStorage rainbowStorage;
      late final RainbowRepositoryImpl rainbowRepositoryImpl;

      setUpAll(() async {
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferencesManager =
            SharedPreferencesManager(sharedPreferences: sharedPreferences);
        rainbowStorage = RainbowStorageImpl(
            sharedPreferencesManager: sharedPreferencesManager);
        rainbowRepositoryImpl =
            RainbowRepositoryImpl(rainbowStorage: rainbowStorage);
      });

      tearDownAll(() async {});

      group('RainbowRepositoryImpl Tests', () {
        test('Fetch and Write Text Color', () async {
          expect(rainbowRepositoryImpl.getTextColor(), 0xFFFFFFFF);
          await rainbowRepositoryImpl.setTextColor(0xFFFF00FF);
          expect(rainbowRepositoryImpl.getTextColor(), 0xFFFF00FF);
        });

        test('Fetch and Write Background Color', () async {
          expect(rainbowRepositoryImpl.getBackgroundColor(), 0xFF000000);
          await rainbowRepositoryImpl.setBackgroundColor(0xFF0000FF);
          expect(rainbowRepositoryImpl.getBackgroundColor(), 0xFF0000FF);
        });
      });
    });
