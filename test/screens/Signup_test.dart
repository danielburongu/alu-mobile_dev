import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test1/screens/Signup.dart';

void main() {
  testWidgets('Signup screen UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: SignupScreen()),
    ));

    // Verify if 'MarketMaster' text is displayed
    expect(find.text('MarketMaster'), findsOneWidget);

    // Verify if 'Sign Up' text is displayed
    expect(find.text('Sign Up'), findsOneWidget);

    // Verify if 'Email', 'Password', 'Full Name' fields are displayed
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);

    // Enter text into 'Email', 'Password', 'Full Name' fields
    await tester.enterText(find.byKey(Key('_userEmail')), 'test@example.com');
    await tester.enterText(find.byKey(Key('_userpassword')), 'password');
    await tester.enterText(find.byKey(Key('_userFullName')), 'John Doe');
  
  });
}
