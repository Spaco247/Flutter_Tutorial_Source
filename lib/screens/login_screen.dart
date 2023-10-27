import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:test_app_2/components/primary_button.dart';
import 'package:test_app_2/components/primary_input.dart';
import 'package:test_app_2/components/primary_password_input_field.dart';
import 'package:test_app_2/controller/auth_controller.dart';
import 'package:test_app_2/screens/main_screen.dart';
import 'package:test_app_2/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    AuthController authController = Get.find();

    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();


    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child:  Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5,),
              const Text(
                "Enter your credentials below"
              ),
              SizedBox(height: 24,),

              PrimaryInputField(
                controller: emailController,
                hint: "Email",
                textInputType: TextInputType.emailAddress,
                validator: (text){
                  if(text == null || text.isEmpty){
                    return "Required";
                  }else if(!GetUtils.isEmail(text)){
                    return 'Enter a valid email';
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 18,),

              PrimaryPasswordInputField(
                controller: passwordController,
                hint: "Password",
                obscureText: true,
                validator: (text){
                  if(text == null || text.isEmpty){
                    return "Required";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 24,),

              PrimaryButton(
                title: "Login",
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    authController.login(
                      email: emailController.value.text,
                      password: passwordController.value.text
                    );
                  }
                }
              ),
              const SizedBox(height: 10,),
              TextButton(
                onPressed: ()=> Get.to(()=> const RegistrationScreen()),
                child: Text(
                  "Don't have an account? Create One"
                )
              )


            ],
          ),
        ),
      ),
    );
  }
}
