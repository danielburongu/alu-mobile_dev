// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test1/screens/Signup.dart';
import 'package:test1/screens/home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _useremail = TextEditingController();

  final _userpassword = TextEditingController();

  // void handleLogin() async {
  void handleLogin(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      String userEmail = _useremail.text.trim();
      String userPassword = _userpassword.text.trim();
      if (userEmail.isEmpty || userPassword.isEmpty) {
        throw ('All fields are required');
      } else {
        // Sign in with email and password
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: userEmail, password: userPassword);

        // Navigate to the home screen
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Center(
              child: Text(message),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32a8a2),
      appBar: AppBar(
        //title: Text('MarketMaster'),
        backgroundColor: Color(0xFF32a8a2),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'MarketMaster', // App Name
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF32a8a2), // Text color
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _useremail,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color(0xFF32a8a2),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _userpassword,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color(0xFF32a8a2),
                              width: 2.0,
                            ),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () => handleLogin(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange, // Background color
                        ),
                        child: Text('LOG IN'),
                      ),
                      SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password button press
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black, // Text color
                        ),
                        child: Text('FORGOT PASSWORD?'),
                      ),
                      SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black, // Text color
                        ),
                        child: Text('SIGN UP'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
