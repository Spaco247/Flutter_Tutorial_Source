import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Hurray!!! We are logged in",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Feel free to logout anytime"
            ),
            SizedBox(height: 24,),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                  "Logout"
              ),
            )

          ],
        ),
      ),
    );
  }
}
