import 'package:flutter/material.dart';


class UserModel {

  final String fullname;
  final String email;


  UserModel({

    required this.fullname,
    required this.email,


  });

  toJson() {
    return {

      "fullname": fullname,
      "email": email,

    };
  }

  factory UserModel.fromSnapshot(dynamic snapshot) {
    final data = snapshot.data()!;
    return UserModel(

      fullname: data['fullname'],
      email: data['email'],

    );
  }


}