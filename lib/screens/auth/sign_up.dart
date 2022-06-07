import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queezy/screens/auth/sign_up_process.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/social_button.dart';
import 'package:queezy/widgets/terms.dart';
import 'package:queezy/widgets/title_text.dart';

import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Sign Up',
      child: Column(
        children: [
          WidgetsUtil.verticalSpace24,
          SocialButton(
            textColor: Constants.white,
            icon: Assets.mail,
            iconColor: Constants.white,
            onTap: () {
              log('Go to SignUpProcess');
              Get.to(
                () => SignUpProcess(),
              );
            },
            text: 'Sign Up with Email',
            showBorder: false,
            background: Constants.primaryColor,
          ),
          WidgetsUtil.verticalSpace16,
          SocialButton(
            textColor: Constants.black1,
            icon: Assets.google,
            onTap: () {},
            text: 'Sign Up with Google',
            showBorder: true,
          ),
          WidgetsUtil.verticalSpace16,
          SocialButton(
            textColor: Constants.white,
            icon: Assets.facebook,
            onTap: () {},
            text: 'Sign Up with Facebook',
            showBorder: false,
            background: Constants.facebookColor,
          ),
          WidgetsUtil.verticalSpace24,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleText(
                text: 'Already have an account? ',
                textColor: Constants.grey2,
                size: Constants.bodyNormal,
                weight: FontWeight.w400,
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    () => const Login(),
                  );
                },
                child: TitleText(
                  text: 'Login',
                  textColor: Constants.primaryColor,
                  size: Constants.bodyNormal,
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
          WidgetsUtil.verticalSpace24,
          const Terms(),
          WidgetsUtil.verticalSpace24,
        ],
      ),
    );
  }
}
