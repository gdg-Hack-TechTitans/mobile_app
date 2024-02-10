import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';


class AuthMiddlware extends GetMiddleware{

  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    if (prefs!.getInt("id") != null) {
      return RouteSettings(name: "/first");
    }

  }
  }