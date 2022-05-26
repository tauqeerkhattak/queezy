import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queezy/screens/auth/login.dart';
import 'package:queezy/screens/auth/sign_up.dart';
import 'package:queezy/screens/home/home.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/default_background.dart';
import 'package:queezy/widgets/title_text.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      background: Assets.background1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetsUtil.verticalSpace24,
          WidgetsUtil.verticalSpace16,
          SizedBox(
            width: 56,
            height: 56,
            child: Image.asset(
              'assets/icons/light_icon.png',
            ),
          ),
          WidgetsUtil.verticalSpace10,
          TitleText(
            text: 'Queezy',
            textColor: Constants.primaryTextColor,
            size: Constants.heading3 - 2,
            fontFamily: 'Nunito',
            weight: FontWeight.w800,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            alignment: Alignment.center,
            child: Image.asset(
              Assets.personsMeeting,
            ),
          ),
          Expanded(
            child: CustomCard(
              child: Column(
                children: [
                  WidgetsUtil.verticalSpace16,
                  TitleText(
                    text: 'Login or Sign Up',
                    size: Constants.heading3,
                    weight: FontWeight.w500,
                  ),
                  WidgetsUtil.verticalSpace8,
                  Container(
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: TitleText(
                      text:
                          'Login or create an account to take quiz, take part in challenge, and more.',
                      align: TextAlign.center,
                      size: Constants.bodyNormal,
                      weight: FontWeight.w400,
                    ),
                  ),
                  CustomButton(
                    text: 'Login',
                    onPressed: () => Get.to(
                      () => const Login(),
                    ),
                  ),
                  CustomButton(
                    backgroundColor: Constants.grey4,
                    text: 'Create Account',
                    textColor: Constants.primaryColor,
                    onPressed: () => Get.to(
                      () => const SignUp(),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.to(() => Home()),
                    child: TitleText(
                      text: 'Later',
                      textColor: Constants.grey2,
                      size: Constants.bodyNormal,
                      weight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
