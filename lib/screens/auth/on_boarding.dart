import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/auth_controller.dart';
import 'package:queezy/screens/auth/login.dart';
import 'package:queezy/screens/auth/sign_up_options.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/default_background.dart';
import 'package:queezy/widgets/title_text.dart';

class OnBoarding extends StatelessWidget {
  final controller = Get.put(AuthController());
  OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.67,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 9,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        controller.selectedIndex.value = value;
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: 60,
                            right: index == 0 ? 40 : 10,
                          ),
                          child: Image.asset(
                            Assets.onBoarding[index],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Obx(
                            () => Container(
                              height: 15,
                              width: 15,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: controller.selectedIndex.value == index
                                    ? Border.all(
                                        width: 2,
                                        color: Colors.white,
                                      )
                                    : const Border.fromBorderSide(
                                        BorderSide.none,
                                      ),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomCard(
              height: Get.height * 0.28,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 16,
                      right: 16,
                    ),
                    child: Obx(
                      () => TitleText(
                        text: controller.onBoarding[controller.selectedIndex.value],
                        textColor: Colors.black,
                        weight: FontWeight.w500,
                        size: Constants.heading3,
                        align: TextAlign.center,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      Get.to(() => const SignUpOptions());
                    },
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TitleText(
                          text: 'Already have an account? ',
                          size: Constants.regularText,
                          textColor: Colors.grey,
                          weight: FontWeight.w400,
                        ),
                        InkWell(
                          onTap: () {
                            log('Login');
                            Get.to(
                              () => const Login(),
                            );
                          },
                          child: TitleText(
                            text: 'Login',
                            size: Constants.regularText,
                            textColor: Constants.royalBlue,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
