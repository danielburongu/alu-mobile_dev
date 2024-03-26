import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test1/screens/dashboard.dart'; // Import your Dashboard widget

void main() {
  testWidgets('Dashboard widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Dashboard(),
    ));

    // Verify that the AppBar contains a title "Dashboard".
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
