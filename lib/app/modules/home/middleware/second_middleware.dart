import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_practics/app/routes/app_pages.dart';

class SecondMiddleware extends GetMiddleware {
  @override
  int? get priority => 4;

  bool isProfileSet = false;

  @override
  RouteSettings? redirect(String? route) {
    if (isProfileSet == false) {
      return RouteSettings(name: Routes.PROFILE);
    }
  }


}
