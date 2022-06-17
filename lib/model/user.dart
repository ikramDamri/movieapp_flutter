
 import 'package:flutter/material.dart';

class UserModel extends StatelessWidget{
  String uid;
  String email;
  String firstName;
  String secondName;
  

  UserModel({required this.uid, required this.email, required this.firstName, required this.secondName});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Container(
              height: 200,
              width: 100,
              //color:  Colors.yellow,
        ),
      ),
    );
  } 

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
