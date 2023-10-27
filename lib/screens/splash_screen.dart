import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_2/controller/general_controller.dart';
import 'package:test_app_2/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    GeneralController generalController  = Get.find();
    generalController.initSplashScreenTimeout1();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Welcome to our basic Splash Screen",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 54,),
            LinearProgressIndicator(),
            SizedBox(height: 10,),
            Text(
              "Please wait...."
            ),
            SizedBox(height: 24,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen()));
              },
              child: Text(
                "Login"
              ),
            )



          ],
        ),
      ),
    );
  }
}
