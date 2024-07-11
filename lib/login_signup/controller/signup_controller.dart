import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert' show json;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:v_express/login_signup/controller/auth_repo.dart';

class SignupController extends GetxController {
  User? user;
  final AuthRepo _repo = AuthRepo();
  bool isLodingState = false;

  handleGoogleSignin() async {
    isLodingState = true;
    update();
    try {
      user = await _repo.signInWithGoogle();
      isLodingState = false;
      update();
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(GetSnackBar(
        title: "Google sign in failed",
        message: e.toString(),
      ));
    }
  }

  handleGoogleSignOut() async {
    isLodingState = true;
    update();
    await _repo.signOutGoogleAccount();
    user = null;
    isLodingState = false;
    update();
  }
}
