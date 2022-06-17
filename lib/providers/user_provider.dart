import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp/model/user.dart';

class UserProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  void addUserData({
    required User currentUser,
    required String firstName,
    //String userImage,
    required String email,
  }) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .set(
      {
        "firstName": firstName,
        "email": email,
        //"userImage": userImage,
        "uid": currentUser.uid,
      },
    );
  }

  UserModel currentData = UserModel(email: '', firstName: '', secondName: '', uid: '',);
  //UserModel loggedInUser = UserModel();


  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("usersData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        email: value.get("email"),
        //userImage: value.get("userImage"),
        firstName: value.get("userName"),
        secondName: value.get("userName"),
        uid: value.get("uid"),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}
