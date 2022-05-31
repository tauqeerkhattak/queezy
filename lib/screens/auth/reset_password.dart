import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queezy/screens/auth/new_password.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/title_text.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Reset Password',
      child: Column(
        children: [
          WidgetsUtil.verticalSpace24,
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: TitleText(
              text:
                  'Enter your email and we will send you a link to reset your password.',
              size: Constants.regularText,
              weight: FontWeight.w400,
            ),
          ),
          WidgetsUtil.verticalSpace24,
          CustomTextField(
            label: 'Email Address',
            hint: 'Your email address',
            prefixIcon: Assets.mail,
          ),
          const Spacer(),
          CustomButton(
            text: 'Reset Password',
            onPressed: () {
              Get.to(
                () => const NewPassword(),
              );
            },
          ),
          WidgetsUtil.verticalSpace24,
        ],
      ),
    );
  }
}
