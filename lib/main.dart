import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_2/controller/auth_controller.dart';
import 'package:test_app_2/controller/general_controller.dart';
import 'package:test_app_2/screens/splash_screen.dart';

import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(GeneralController());
  Get.put(AuthController());

  runApp(const OurApp());
}

class OurApp extends StatelessWidget {
  const OurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
    );
  }
}
