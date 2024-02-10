import 'package:event_manager/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class Login extends StatelessWidget {
  Login({super.key});

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/A_black_image.jpg.webp"),
            // replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 261,
              ),
              Image.asset("assets/logo.png"),
              SizedBox(
                height: 40,
              ),
              Form(
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 300.0,
                        child: TextFormField(
                          
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            // Adjust vertical padding
                            prefixIcon: Icon(Icons.person_outline_rounded),
                            labelText: "USERNAME",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: "Enter your username",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white, // Set text color to white
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300.0,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white, 
                            // Set text color to white
                          ),
                          controller: controller.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: "Enter your password",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10), // Adjust vertical padding
                          ),      
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300.0, // Set your desired width
                        child: ElevatedButton(
                          onPressed: () {
                            controller.authenticate();
                            if (controller.isAuthenticated.value) {
                              prefs!.setInt("id", 1);
                              prefs!.setString(
                                  "userType", controller.userType.value);
                              print("${prefs!.getString('userType')}");
                            }else{
                               Get.snackbar("dev mode(backend not completed)", "the auth is not completed in  the backend so for login {username :yasser,password:yasser} also i am defining that user as participant and to see the mentor pages change {userType.value = 'participant';} in login_controller.dart line 28 to { userType.value = 'mentor'} ",colorText: Colors.white,duration: Duration(seconds: 10),);
                          }
                            
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            // Adjust vertical padding

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius
                                  .zero, // Set border radius to zero
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
