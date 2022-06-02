import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/splash_controller.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/default_background.dart';
import 'package:queezy/widgets/title_text.dart';

class Splash extends StatelessWidget {
  final controller = Get.put(SplashController());
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/icons/light_icon.png',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TitleText(
              text: 'Queezy',
              textColor: Constants.white,
              size: 36,
              fontFamily: 'Nunito',
              weight: FontWeight.w800,
            ),
          ],
        ),
      ),
    );
  }
}
