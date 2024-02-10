import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../view/app_main_page.dart';


class LoginController extends GetxController {



  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isAuthenticated = false.obs;
  RxString userType = ''.obs;

  Future<void> authenticate() async {
    final String username = usernameController.text;
    final String password = passwordController.text;
    print("this is the username $username and this is the password $password");

    // Example authentication logic
    // Replace this with your actual authentication logic
    if (username == 'yasser' && password == 'yasser') {
      isAuthenticated.value = true;
      print( "comaraison result is  ${isAuthenticated.value}");
      // Set user type based on authentication (e.g., admin, user, etc.)
      userType.value = 'participant'; // Replace 'admin' with the actual user type
      // Navigate to the next screen after successful authentication
      Get.to(() => AppMainPage());
    } else {
      isAuthenticated.value = false;
    }
  }
  Future<String?> getUserType() async {
    return prefs!.getString('userType');
  }
}