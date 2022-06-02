import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/screens/auth/on_boarding.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 10),
      () {
        debugPrint('Splash');
        Get.to(() => OnBoarding(),);
      },
    );
    super.onInit();
  }
}
