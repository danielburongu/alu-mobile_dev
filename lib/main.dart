import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Demo assignment 1',
      theme: ThemeData(
        // This is the theme of the application.

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HelloWorld(),
    );
  }
}


class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello World app"),
        ),
        body: Center(child: Text("Hello World", style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}