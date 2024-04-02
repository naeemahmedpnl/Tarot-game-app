// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tarrot/data/network_service.dart';
import 'package:tarrot/models/user_model.dart';
import 'package:tarrot/utils/utils.dart';

import '../models/phone_verification_result_model.dart';
import '../utils/route/routes_name.dart';

class AuthViewModel extends ChangeNotifier {
  // LOGIN
  bool _loginbtn = false;
  bool get isloginbtn => _loginbtn;

  // UPDATE ACCOUNT
  bool _updateAccountbtn = false;
  bool get updateAccountbtn => _updateAccountbtn;

  // STOER USER BUTTON
  bool _updateStoreUserbtn = false;
  bool get updateStoreUserbtn => _updateStoreUserbtn;
  // FORGOT PASSWORD LOADING
  bool _forgotPasswordLoading = false;
  bool get forgotPasswordLoading => _forgotPasswordLoading;

  // PHONE AUTHENTICATION
  bool _phoneAuthenticationLoading = false;
  bool get phoneAuthenticationLoading => _phoneAuthenticationLoading;

  // SET PHONE AUTHENTICATION LOADING
  void setPhoneAuthenticationLoading(bool value) {
    _phoneAuthenticationLoading = value;
    notifyListeners();
  }

  // SET UPDATE ACCOUNT LOADING
  void setUpdateAccountLoading(bool value) {
    _updateAccountbtn = value;
    notifyListeners();
  }

  // SET STORE USER DATA
  void setStoreUserDataLoading(bool value) {
    _updateStoreUserbtn = value;
    notifyListeners();
  }

  // SET FORGOT PASSWORD LOADING
  void setForgotPasswordLoading(bool value) {
    _forgotPasswordLoading = value;
    notifyListeners();
  }

  // SET BUTTON LOGIN LOADING
  void setBtnLoginLoading(bool value) {
    _loginbtn = value;
    notifyListeners();
  }

  // FIRST NAME , LAST NAME , EMAIL , PASSWORD & CONFIRM PASSWORD CONTROLLER
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    confirmPassController.dispose();
    passwordController.dispose();
  }

  final NetworkService networkService = NetworkService();

  //  SIGN IN USER
  Future<void> signIn(
    String email,
    String password,
    void Function() navigateToNextScreen,
  ) async {
    try {
      setBtnLoginLoading(true);
      bool loggedIn = await networkService.signInWithEmailAndPassword(
        email,
        password,
      );
      debugPrint(loggedIn.toString());
      if (loggedIn) {
        setBtnLoginLoading(false);
        navigateToNextScreen();
      }
    } finally {
      setBtnLoginLoading(false);
    }
  }

  // SEND RESET LINK
  Future<void> sendResetLink(String email) async {
    try {
      setForgotPasswordLoading(true);
      await networkService.sendResetEmailToUser(email).then((value) {
        setForgotPasswordLoading(false);
      });
    } on FirebaseAuthException catch (e) {
      setForgotPasswordLoading(false);
      Utils.showToast(message: e.message.toString());
    }
  }

  // CREATE ACCOUNT FOR USER
  Future<void> createUserAccount(
    String email,
    String password,
  ) async {
    try {
      setUpdateAccountLoading(true);
      await networkService.createUserWithEmailAndPassword(email, password);
    } finally {
      setUpdateAccountLoading(false);
    }
  }

  // CREATE ACCOUNT FOR USER
  Future<void> storeUserDataInDatabase(
    UserModel user,
  ) async {
    try {
      setStoreUserDataLoading(true);
      await networkService.storeUserData(user);
    } finally {
      setStoreUserDataLoading(false);
    }
  }

  // SIGN OUT USER
  Future<void> logoutUser(
    void Function() navigateToNextScreen,
  ) async {
    try {
      await networkService.signOut().then((value) {
        navigateToNextScreen();
        Utils.showToast(message: 'Sign out');
      });

      await networkService.handleSignOut();
    } on FirebaseAuthException catch (e) {
      Utils.showToast(message: e.message.toString());
    }
  }

  Future<void> signUpWithPhoneNumberAndOTP(
      String phoneNumber, BuildContext context) async {
    try {
      // Set loading state
      setPhoneAuthenticationLoading(true);

      // Call the method from the network service to initiate phone number verification
      PhoneVerificationResult verificationResult = await networkService
          .signInWithPhoneNumberAndOTP(phoneNumber, context);

      if (verificationResult.success) {
        // If verification initiated successfully, navigate to OTP screen
        String? verificationId = verificationResult.verificationId;
        if (verificationId != null) {
          await Future.delayed(const Duration(seconds: 4));

          navigateToOtpVerifyScreen(context, phoneNumber, verificationId);
        } else {
          // Handle the case where verification ID is null
          Utils.showToast(message: 'Failed to initiate verification');
        }
      } else {
        // Handle error if verification initiation failed
        Utils.showToast(message: 'Failed to initiate verification');
      }
    } finally {
      // Reset loading state
      setPhoneAuthenticationLoading(false);
    }
  }

  void navigateToOtpVerifyScreen(
      BuildContext context, String phoneNumber, String verificationId) {
    Navigator.pushNamed(
      context,
      RouteName.otpPhoneView,
      arguments: {
        'phoneNumber': phoneNumber,
        'verificationId': verificationId,
      },
    );
  }

// Method to verify OTP
  Future<void> verifyOTP(
      String verificationId, String otp, String phoneNumber) async {
    try {
      // Set loading state
      setUpdateAccountLoading(true);

      // Call the method from the network service to verify OTP
      await networkService.verifyOtp(verificationId, otp, phoneNumber);

      // If OTP verification successful, navigate to next screen
    } finally {
      // Reset loading state
      setUpdateAccountLoading(false);
    }
  }

  // SIGN IN WITH GOOGLE

  Future<void> signInWithGoogle(void Function() navigateToNextScreen) async {
    try {
      UserCredential? userCredential = await networkService.signInWithGoogle();
      // Check if userCredential is null, meaning the user canceled Google sign-in
      if (userCredential != null) {
        // Navigate to the next screen upon successful sign-in
        navigateToNextScreen();
      } else {
        // Handle the case where the user canceled Google sign-in
        debugPrint("User canceled Google sign-in");
      }
    } catch (e) {
      Utils.showToast(message: "Error signing in with Google: $e");
    }
  }
}
