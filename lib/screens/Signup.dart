// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test1/screens/Login.dart';
import 'package:test1/screens/home_page.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _userEmail = TextEditingController();
  final _userpassword = TextEditingController();
  final _userFullName = TextEditingController();
  late bool isAdmin;
  //  ======= HANDLE REGISTER NEW USER =========
  Future handleSignUp(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      String userEmail = _userEmail.text.trim();
      String userPassword = _userpassword.text.trim();
      String fullname = _userFullName.text.trim();
      isAdmin = false;
      if (userEmail.isEmpty || userPassword.isEmpty || fullname.isEmpty) {
        throw ('All fields are required');
      } else {
        // Sign in with email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userEmail, password: userPassword);

        // === ADD USER TO THE FIRESTORE DATABASE ======

        addUserToDB(fullname, userEmail, userPassword, isAdmin);
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

  // ======== DISPLAY ERROR POPUP ========
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

  // ===== Add user To DB function ====
  Future addUserToDB(
      String fullname, String email, String password, bool isAdmin) async {
    await FirebaseFirestore.instance.collection("users").add({
      'fullname': fullname,
      "email": email,
      "password": password,
      "isAdmin": false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32a8a2),
      appBar: AppBar(
        backgroundColor: Color(0xFF32a8a2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'MarketMaster',
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF32a8a2),
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
                        controller: _userEmail,
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
                      Text(
                        'Full Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _userFullName,
                        decoration: InputDecoration(
                          hintText: 'Enter your full name',
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
                      ElevatedButton(
                        onPressed: () => handleSignUp(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                        child: Text('SIGN UP'),
                      ),
                      SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()))
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: Text('ALREADY HAVE AN ACCOUNT?'),
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
    home: SignupScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
