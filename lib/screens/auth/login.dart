import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queezy/screens/auth/reset_password.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_divider.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/social_button.dart';
import 'package:queezy/widgets/terms.dart';
import 'package:queezy/widgets/title_text.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Login',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SocialButton(
              textColor: Constants.black2,
              icon: Assets.google,
              background: Constants.primaryTextColor,
              onTap: () {},
              horizontalMargin: 16,
              verticalMargin: 24,
              text: 'Login with Google',
              showBorder: true,
            ),
            SocialButton(
              textColor: Constants.primaryTextColor,
              icon: Assets.facebook,
              background: Constants.facebookColor,
              onTap: () {},
              horizontalMargin: 16,
              verticalMargin: 16,
              text: 'Login with Facebook',
              showBorder: false,
            ),
            const CustomDivider(
              text: 'OR',
              verticalMargin: 24,
            ),
            WidgetsUtil.verticalSpace24,
            CustomTextField(
              label: 'Email Address',
              hint: 'Your email address',
              prefixIcon: Assets.mail,
            ),
            WidgetsUtil.verticalSpace16,
            CustomTextField(
              label: 'Password',
              hint: 'Your password',
              prefixIcon: Assets.password,
              suffixIcon: Assets.eye,
              onSuffixTap: () {
                log('Suffix');
              },
            ),
            CustomButton(
              text: 'Login',
              onPressed: () => log('Login'),
            ),
            WidgetsUtil.verticalSpace24,
            InkWell(
              onTap: () => Get.to(
                () => const ResetPassword(),
              ),
              child: TitleText(
                text: 'Forgot Password?',
                size: Constants.bodyNormal,
                textColor: Constants.primaryColor,
                weight: FontWeight.w500,
              ),
            ),
            WidgetsUtil.verticalSpace24,
            const Terms(),
            WidgetsUtil.verticalSpace24,
          ],
        ),
      ),
    );
  }
}
