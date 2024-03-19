import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/screens/home_page.dart';
import 'package:test1/screens/onboarding_screen.dart';
import 'package:test1/services/userrepo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthentificationRepository extends GetxController {
  static AuthentificationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final UserRepository _userRepository = Get.put(UserRepository());

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const OnboardingScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (error) {
      print("Failed to sign in with Google: $error");
      Get.snackbar("Error", "Failed to sign in with Google.",
          colorText: Colors.red);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print("Failed to sign out: $error");
      Get.snackbar("Error", "Failed to sign out.", colorText: Colors.red);
    }
  }
}
