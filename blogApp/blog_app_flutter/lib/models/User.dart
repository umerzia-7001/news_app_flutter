import 'package:flutter/cupertino.dart';


class User{

  String? id;
  String name;
  String email;

   User( {this.id , required this.name, required this.email});

   factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email :json['email'],
    );
  }

}




