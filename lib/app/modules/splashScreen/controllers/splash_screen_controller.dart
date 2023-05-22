import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gososmed_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    log("Splash...");
    Future.delayed(const Duration(seconds: 5)).then((value) => Get.offAndToNamed(Routes.INTEREST_PAGE));
    super.onReady();
  }

  // late AnimationController controller;
  // @override
  // void onInit() {
  //   // controller = AnimationController(
  //   //     vsync: this,
  //   //     duration: Duration(seconds: 1),
  //   //     upperBound: 100.0);
  //   controller.forward();
  //   controller.addListener(() {
  //     print(controller.value);
  //   });
  //   super.onInit();
  // }
}
