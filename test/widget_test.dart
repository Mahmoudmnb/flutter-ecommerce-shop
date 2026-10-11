import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget test harness builds a MaterialApp', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Text('Shop app'))),
    );

    expect(find.text('Shop app'), findsOneWidget);
  });
}
