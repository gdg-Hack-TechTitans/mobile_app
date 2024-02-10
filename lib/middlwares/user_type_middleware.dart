import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


class UserTypeMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (prefs!.getString("userType") == 'participent') {
      return RouteSettings(name: "/mentors_list");
    }else if (prefs!.getString("usertype") == 'mentor'){
      return RouteSettings(name: "/mentor_notification");
    }
  }
}