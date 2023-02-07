import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigator {
  CustomNavigator._();
  // Pushes to the route specified
  static Future<dynamic>? pushTo(String strPageName, {dynamic arguments}) {
    return Get.toNamed(strPageName, arguments: arguments);
  }

  // Pop the top view
  static pop({dynamic result}) {
    return Get.back(result: result);
  }

  // Pops to a particular view
  static popTo(String strPageName, {dynamic arguments}) {
    Get.offNamedUntil(strPageName, (route) => false, arguments: arguments);
  }

  // push and pop all
  static pushAndPopAll(String strPageName, {dynamic arguments}) {
    Get.offAllNamed(
      strPageName,
      arguments: arguments,
    );
  }

  // Pop current and push to a particular view
  static pushReplacement(String strPageName, {dynamic arguments}) {
    print("=============from push replacement");
    Get.offNamed(strPageName, arguments: arguments);
  }

  static pushAndPopUntil(String popUptoPageName, String pushPagename,
      {dynamic arguments}) {
    Get.offNamedUntil(pushPagename, ModalRoute.withName(popUptoPageName),
        arguments: arguments);
  }
}
