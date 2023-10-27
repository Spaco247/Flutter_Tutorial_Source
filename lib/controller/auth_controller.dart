import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_app_2/screens/main_screen.dart';
import 'package:test_app_2/utils/Utils.dart';

class AuthController extends GetxController{


  void login({required String email, required String password}) async{
    Utils.showProgressDialog();

    try{

      final authInstance = FirebaseAuth.instance;

      final response = await authInstance.signInWithEmailAndPassword(email: email, password: password);

      Get.back();

      if(response.user == null){
        Utils.showErrorToast("Error", "Enter valid email or password");
      }else{
        Get.offAll(()=> const MainScreen());
      }

    }catch(e){
      print(e);
      print(e.runtimeType);
      Get.back();
      Utils.showErrorToast("Error", (e as FirebaseAuthException).message!);
    }

  }

  void createAccount({required String name, required String email, required String phone, required String password })async{

    Utils.showProgressDialog();

    try{

      final authResponse = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if(authResponse.user == null){
        Get.back();
        Utils.showErrorToast("Error", "Unable to create user");
      }else{

        final userData = <String, dynamic>{
          "name": name,
          "phone": phone,
          "email": email,
          "image": ""
        };

        await FirebaseFirestore.instance
          .collection("users")
          .doc(authResponse.user!.uid)
          .set(userData);

        Get.back();

        Utils.showSuccessToast("Success", "Account created successfully");

        Get.to(()=> const MainScreen());

      }

    }catch(e){
      print(e);
      print(e.runtimeType);
      Get.back();
      Utils.showErrorToast("Error", (e as FirebaseAuthException).message!);
    }

  }

}