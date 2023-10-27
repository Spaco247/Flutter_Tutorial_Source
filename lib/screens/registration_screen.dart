import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/primary_button.dart';
import '../components/primary_input.dart';
import '../components/primary_password_input_field.dart';
import '../controller/auth_controller.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    AuthController authController = Get.find();

    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

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
                "Create Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5,),
              const Text(
                  "Provide Details below"
              ),
              const SizedBox(height: 24,),

              PrimaryInputField(
                controller: nameController,
                hint: "Name",
                textInputType: TextInputType.name,
                validator: (text){
                  if(text == null || text.isEmpty){
                    return "Required";
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 18,),

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

              PrimaryInputField(
                controller: phoneController,
                hint: "Phone",
                textInputType: TextInputType.phone,
                validator: (text){
                  if(text == null || text.isEmpty){
                    return "Required";
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
                title: "Create Account",
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    authController.createAccount(
                      name: nameController.value.text,
                      email: emailController.value.text,
                      phone: phoneController.value.text,
                      password: passwordController.value.text
                    );
                  }
                }
              )


            ],
          ),
        ),
      ),
    );

  }
}
