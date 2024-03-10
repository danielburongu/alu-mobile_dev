import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test1/services/userrepo.dart';

import 'auth_repo.dart';



class UserDetailsController extends GetxController{
  static UserDetailsController get instance => Get.find();

  // get user firstname and pass below
  final _authRepo = Get.put(AuthentificationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final Email = _authRepo.firebaseUser.value?.email;
    if(Email != null){
      return _userRepo.getUserDetails(Email);
    } else {
      Get.snackbar("Error", "Something is wrong try again", colorText: Colors.red);
    }
  }




}
