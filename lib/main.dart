import 'package:event_manager/middlwares/auth_middleware.dart';
import 'package:event_manager/middlwares/user_type_middleware.dart';
import 'package:event_manager/view/app_main_page.dart';
import 'package:event_manager/view/login.dart';
import 'package:event_manager/view/mentors.dart';
import 'package:event_manager/view/montors_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, getPages: [
      GetPage(
        name: '/',
        page: () => Login(),
        middlewares: [AuthMiddlware()],
      ),
      GetPage(name: "/first", page: () => AppMainPage()),
      GetPage(
        name: "/mentor_notification",
        page: () => MentorsNotification(),
        middlewares: [UserTypeMiddleware()],
      ),
      GetPage(
        name: "/mentors_list",
        page: () => Mentors(),
        middlewares: [UserTypeMiddleware()],
      ),
    ]);
  }
}
