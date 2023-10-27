import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_app_2/screens/login_screen.dart';
import 'package:test_app_2/screens/main_screen.dart';

class GeneralController extends GetxController{


  /// ****************************************************
  /// This function navigates you automatically to the
  /// the specified screens based on the condition weather
  /// user is logged in
  ///****************************************************
  void initSplashScreenTimeout1(){
    Timer(const Duration(seconds: 3), () {
      final authUser = FirebaseAuth.instance.currentUser;

      if(authUser == null){
        Get.offAll(()=> const LoginScreen());
      }else{
        Get.offAll(()=> const MainScreen());
      }

    });
  }


  /// ****************************************************
  /// This function would display login or registration
  /// buttons after a specified duration
  ///****************************************************
  void initSplashScreenTimeout2(){
    Timer(const Duration(seconds: 3), () {

    });
  }


}