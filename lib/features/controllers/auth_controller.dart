// auth_controller.dart
import 'dart:developer';

import 'package:get/get.dart';
import 'package:machinetask/presentation/components/snakbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final firebaseInstance = FirebaseAuth.instance;
  RxBool isRegisterUser = false.obs;

  final GoogleSignIn googleSignIn = GoogleSignIn();

// Google authentication

  Future<void> googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential authResult =
          await firebaseInstance.signInWithCredential(credential);
      User? user = authResult.user;
      if (user != null) {
        // Handle successful login
        Shared().snakbar(title: 'Login Successfull', message: '');
          Get.offNamed('/home');
      } else {
        // Handle login failure
        Shared().snakbar(
            title: 'something went wrong', message: 'try again after sometime');
      }
    } catch (e) {
      log('someting went wrong on goodle authentication $e');
    }
  }

  //login method
  Future<void> login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Successful signn
        User? user = userCredential.user;
        if (user != null) {
          log('User signed in: ${user.uid}');
          Shared().snakbar(title: 'Login Successfull', message: '');
          Get.offNamed('/home');
        }
      } else {
        Shared().snakbar(
            title: 'Login Error', message: 'Please fill all the fields');
      }
    } catch (e) {
      // Handle different exceptions based on the error
      if (e is FirebaseAuthException) {
        Shared().snakbar(title: 'Login Error', message: e.code);
      } else {
        //exceptions that are not FirebaseAuthException
        log('An error occurred: $e');
      }
    }
  }

// new user register method
  Future<void> RegisterUser(String email, String password) async {
    try {
      isRegisterUser.value = true;
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseInstance.createUserWithEmailAndPassword(
            email: email, password: password);

        Shared().snakbar(title: 'Registration Successfull', message: '');
      } else {
        Shared().snakbar(title: 'Please fill all the fields', message: '');
      }
      isRegisterUser.value = false;
    } catch (e) {
      log('something went wrong while registering user $e');
    }
  }
}
