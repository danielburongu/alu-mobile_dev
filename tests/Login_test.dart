import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test1/screens/Login.dart'; // Import your LoginScreen widget
import 'package:firebase_core/firebase_core.dart';

void main() {
  // setUpAll(() async {
  //   // Initialize Firebase
  //   await Firebase.initializeApp();
  // });

  testWidgets('Test LoginScreen', (WidgetTester tester) async {
    // Build the LoginScreen widget
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Verify if the login screen is displayed
    expect(find.text('Log In'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Fill in the email and password fields
    await tester.enterText(
        find.byType(TextFormField).first, 'test@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'password');

    // Tap the login button
    // await tester.tap(find.text('LOG IN'));
    // await tester.pump();

    // Verify if the progress indicator is displayed
    // expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // TODO: Simulate successful login and verify navigation to the home screen
    // TODO: Simulate failed login and verify if the error message is displayed
  });
}
