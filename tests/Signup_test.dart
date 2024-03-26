import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test1/screens/Signup.dart'; // Import your SignupScreen widget
import 'package:firebase_core/firebase_core.dart';

void main() {
  // setUpAll(() async {
  //   // Initialize Firebase
  //   await Firebase.initializeApp();
  // });

  testWidgets('Test SignupScreen', (WidgetTester tester) async {
    // Build the SignupScreen widget
    await tester.pumpWidget(MaterialApp(
      home: SignupScreen(),
    ));

    // Verify if the signup screen is displayed
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);

    // Fill in the email, password, and full name fields
    await tester.enterText(
        find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.enterText(find.byType(TextFormField).at(2), 'John Doe');

    // // Tap the signup button
    // await tester.tap(find.text('SIGN UP'));
    // await tester.pump();

    // // Verify if the progress indicator is displayed
    // expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // TODO: Simulate successful signup and verify navigation to the home screen
    // TODO: Simulate failed signup and verify if the error message is displayed
  });
}
