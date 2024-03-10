import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test1/main.dart';
import 'package:test1/screens/home_page.dart';
import 'package:test1/services/userrepo.dart';

import '../screens/dashboard.dart';
import '../screens/onboarding_screen.dart';



class AuthentificationRepository extends GetxController{
  static AuthentificationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final UserRepo = Get.put(UserRepository());

  // var verificationId = ''.obs;

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 5));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, setIniationScreen);
    // setIniationScreen(firebaseUser.value);
  }

  setIniationScreen(User? user) {
    user == null ? Get.offAll(() => const OnboardingScreen()) : Get
        .offAll(() => const HomeScreen());
  }




// log out function
  Future<void> logout() async => await _auth.signOut();


}
