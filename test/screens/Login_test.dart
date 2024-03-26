import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../screens/Login.dart';

void main() {
  testWidgets('Login screen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Verify if 'MarketMaster' text is displayed
    expect(find.text('MarketMaster'), findsOneWidget);

    // Verify if 'Log In' text is displayed
    expect(find.text('Log In'), findsOneWidget);

    // Verify if 'Email' and 'Password' fields are displayed
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Verify if 'LOG IN' button is displayed
    expect(find.widgetWithText(ElevatedButton, 'LOG IN'), findsOneWidget);

    // Verify if 'SIGN UP' button is displayed
    expect(find.text('SIGN UP'), findsOneWidget);
  });



}
