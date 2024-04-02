import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarrot/data/base_service.dart';
import 'package:tarrot/models/user_model.dart';
import 'package:tarrot/resources/service/service_constants.dart';
import 'package:tarrot/utils/utils.dart';

import '../models/phone_verification_result_model.dart';
import '../utils/route/routes_name.dart';

class NetworkService extends BaseService {
  // CREATE USER WITH EMAIL & PASSWORD
  @override
  Future createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Utils.showToast(message: "Account Created");
    } on FirebaseAuthException catch (error) {
      Utils.showToast(message: error.message.toString());
    }
  }

  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Utils.showToast(message: "Logged in");
      return auth.currentUser != null;
    } on FirebaseAuthException catch (e) {
      Utils.showToast(message: e.message.toString());
      debugPrint(e.message);
      return false;
    }
  }

  // SIGN OUT
  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> storeUserData(UserModel user) async {
    try {
      await userCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user.toMap());
    } catch (error) {
      rethrow;
    }
  }

  // SEND RESET EMAIL TO USER
  @override
  Future<void> sendResetEmailToUser(String email) {
    return auth.sendPasswordResetEmail(email: email);
  }

  // SIGN UP WITH PHONE NUMBER
  @override
  Future<PhoneVerificationResult> signInWithPhoneNumberAndOTP(
    String phoneNumber,
    BuildContext context,
  ) async {
    try {
      String? verificationId;

      // Verify phone number
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Sign in with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            debugPrint('The provided phone number is not valid.');
          } else {
            debugPrint("Issue Occured in Verification: ${e.code}");
          }
        },
        codeSent: (String vId, int? resendToken) async {
          verificationId = vId;
          debugPrint('Verification ID: $verificationId   token: $resendToken');
          Navigator.pushNamed(
            context,
            RouteName.otpPhoneView,
            arguments: {
              'phoneNumber': phoneNumber,
              'verificationId': verificationId,
            },
          );
        },
        codeAutoRetrievalTimeout: (String vId) {
          verificationId = vId;
          debugPrint('Timeout - Auto Retrieval: $verificationId');
        },
      );

      if (verificationId != null) {
        return PhoneVerificationResult(
            success: true, verificationId: verificationId);
      } else {
        return PhoneVerificationResult(success: false);
      }
    } catch (e) {
      debugPrint("Error occurred during phone verification: $e");
      return PhoneVerificationResult(success: false);
    }
  }

  // Verify OTP
  @override
  Future<void> verifyOtp(
    String verificationId,
    String otp,
    String phoneNum,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential).then((value) async {
        debugPrint("User: $value");
      });
    } catch (e) {
      debugPrint('Error verifying OTP: $e');
    }
  }

  // Send Reset Password Email
  @override
  Future<void> sendResetPasswordEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint('Error verifying OTP: $e');
    }
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled Google sign-in, return null
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Handle any errors that occur during Google sign-in
      debugPrint("Error signing in with Google: $e");
      rethrow; // Rethrow the error to be handled by UI if needed
    }
  }

  // [HANDLE SIGN OUT]
  @override
  Future<void> handleSignOut() => GoogleSignIn().disconnect();

  // [SAVE USER DATA TO SHARED PREFERENCES]
  @override
  Future<void> saveUserDataToSharedPreferences(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('user', userJson);
  }

  // [GET USER DATA FROM SHARED PREFERENCES]
  @override
  Future<UserModel?> getUserDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    UserModel? user;
    try {
      if (userJson != null) {
        debugPrint("Retrieved user data from SharedPreferences: $userJson");
        Map<String, dynamic> userMap = jsonDecode(userJson);
        user = UserModel.fromMap(userMap);
        debugPrint("User email: ${user.email}");
      } else {
        debugPrint("No user data found in SharedPreferences");
      }
    } catch (e) {
      debugPrint("Error retrieving user data: $e");
    }
    return user;
  }

  @override
  Future<UserModel?> fetchUserData(String userId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
