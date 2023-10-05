// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:solid_software/src/app.dart';
import 'package:solid_software/src/feature/rainbow/widget/rainbow_view.dart';

void main() {
  group('Widget Test', () {
    SharedPreferences.setMockInitialValues({});
    late final App app;
    late final SharedPreferences sharedPreferences;

    setUpAll(() async {
      sharedPreferences = await SharedPreferences.getInstance();
      app = App(sharedPreferences: sharedPreferences);
    });

    tearDownAll(() async {});

    testWidgets('Find Text', (WidgetTester tester) async {
      await tester.pumpWidget(app);
      expect(find.text('Hello There'), findsOneWidget);
    });

    testWidgets('Tap triggers color change', (WidgetTester tester) async {
      await tester.pumpWidget(app);

      expect(find.byType(AnimatedContainerExample), findsOneWidget);

      final decoratedBoxFinder = find.byType(DecoratedBox);

      final initialColor = (tester
              .widget<DecoratedBox>(
                decoratedBoxFinder,
              )
              .decoration as BoxDecoration)
          .color;

      await tester.tap(find.byType(AnimatedContainerExample));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final newColor = (tester
              .widget<DecoratedBox>(
                decoratedBoxFinder,
              )
              .decoration as BoxDecoration)
          .color;

      expect(initialColor, isNot(newColor));
    });
  });
}
