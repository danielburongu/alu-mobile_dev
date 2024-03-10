// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test1/screens/Login.dart';
import 'package:test1/screens/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test1/screens/onboarding_screen.dart';
import 'package:test1/services/auth_repo.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => AuthentificationRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ' Demo assignment 1',
      theme: ThemeData(
        // This is the theme of the application.

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
// Welcome page:

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32a8a2),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180), // Add space from top
              Text(
                "Market-Master",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              SizedBox(height: 50),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'lib/images/new market.jpg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,

                  // Adjust the width and height as needed
                ),
              ),
              // Add space between image and buttons
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(
                          0xFF32a8a2), backgroundColor: Colors.white, // Change the text color to match background
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text("Sign Up"),
                  ),
                  SizedBox(height: 20), // Add space between buttons
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white, side: BorderSide(color: Colors.white),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text("Already have an account"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF32a8a2),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,
                size: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Add Product',
          ),
        ],
      ),
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
        body: Center(
            child: Text(
          "Hello World",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
