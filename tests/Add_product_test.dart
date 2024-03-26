import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test1/screens/Add_product.dart';

void main() {
  // setUpAll(() async {
  //   // Initialize Firebase
  //   await Firebase.initializeApp();
  // });

  testWidgets('Test AddProductScreen', (WidgetTester tester) async {
    // Build the AddProductScreen widget
    await tester.pumpWidget(MaterialApp(
      home: AddProductScreen(),
    ));

    // Verify if the AddProductScreen is displayed
    expect(find.text('Add New Product'), findsOneWidget);
    expect(find.text('Product Name'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Price'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Simulate tapping the 'Add Product' button
    // await tester.tap(find.byKey(const Key('add_product_button')));
    // await tester.pump(); // Rebuild the widget after the button tap

    // // Verify the behavior after tapping the button
    // expect(find.byType(CircularProgressIndicator),
    //     findsOneWidget); // Check if progress indicator is displayed

    // TODO: Add more verification steps here based on your app's behavior
    // For example, verify if the form fields are cleared after a successful upload
    // Verify if navigation to the home screen is performed
  });
}
