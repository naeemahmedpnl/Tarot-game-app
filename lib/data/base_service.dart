import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tarrot/models/user_model.dart';

import '../models/phone_verification_result_model.dart';

abstract class BaseService {
  // SIGN IN WITH EMAIL AND PASSWORD
  Future<bool> signInWithEmailAndPassword(String email, String password);

  // CREATE USER WITH EMAIL AND PASSWORD
  Future createUserWithEmailAndPassword(String email, String password);

  // SIGN IN WITH PHONE NUMBER AND OTP
  Future<PhoneVerificationResult> signInWithPhoneNumberAndOTP(
    String phoneNumber,
    BuildContext context,
  );

  // VERIFY THE OTP
  Future<void> verifyOtp(String verificationId, String otp, String phoneNum);

  // SIGN OUT
  Future<void> signOut();

  // SEND RESET EMAIL TO USER
  Future<void> sendResetEmailToUser(String email);

  // STORE USER DATA
  Future<void> storeUserData(UserModel user);

  // FORGET PASSWORD: SEND RESET PASSWORD EMAIL TO USER
  Future<void> sendResetPasswordEmail(String email);

  // GOOGLE SIGN IN
  Future<UserCredential?> signInWithGoogle();

  // Handle Google Sign Out
  Future<void> handleSignOut();

  // Save user Data in Shared Preference
  Future<void> saveUserDataToSharedPreferences(UserModel user);

  // [GET USER DATA FROM DEVICE]
  Future<UserModel?> getUserDataFromSharedPreferences();

  // [FETCH USER DATA]
  Future<UserModel?> fetchUserData(String userId);
}
