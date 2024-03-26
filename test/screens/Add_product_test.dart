import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test1/screens/Add_product.dart';

void main() {
  testWidgets('Test AddProductScreen', (WidgetTester tester) async {
    // Build the AddProductScreen widget
    await tester.pumpWidget(const MaterialApp(
      home: AddProductScreen(),
    ));

    // Verify if the AddProductScreen is displayed
    expect(find.text('Add New Product'), findsOneWidget);
    expect(find.text('Product Name'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Price'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
