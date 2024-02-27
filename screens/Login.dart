import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32a8a2),
      appBar: AppBar(
        //title: Text('MarketMaster'),
        backgroundColor: const Color(0xFF32a8a2),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'MarketMaster', // App Name
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF32a8a2), // Text color
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color(0xFF32a8a2),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color(0xFF32a8a2),
                              width: 2.0,
                            ),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle login button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // Background color
                        ),
                        child: const Text('LOG IN'),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password button press
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black, // Text color
                        ),
                        child: const Text('FORGOT PASSWORD?'),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          // Handle sign up button press
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black, // Text color
                        ),
                        child: const Text('SIGN UP'),
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
  runApp(const MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
