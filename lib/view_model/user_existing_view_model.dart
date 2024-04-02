import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarrot/models/user_model.dart';

import '../resources/service/service_constants.dart';

class UserExistenceProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> checkUserExistence() async {
    saveUserData();
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(user.uid).get();
      return snapshot.exists;
    }
    return false;
  }

  Future saveUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(user!.uid).get();
    UserModel userModel = UserModel(
      uid: FirebaseAuth.instance.currentUser!.uid,
      name: snapshot.data()?['name'] ?? '',
      dob: snapshot.data()?['name'] ?? '',
      email: snapshot.data()?['name'] ?? '',
      gender: snapshot.data()?['name'] ?? '',
      phone: snapshot.data()?['name'] ?? '',
      profile: snapshot.data()?['name'] ?? '',
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(userModel.toJson());
    await prefs.setString('user', userJson);
  }
}
