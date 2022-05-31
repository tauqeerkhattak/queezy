import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/auth_controller.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/title_text.dart';

class SignUpProcess extends StatelessWidget {
  final controller = Get.find<AuthController>();
  SignUpProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.selectedProcess.value = 0;
    return Obx(
      () => DefaultLayout(
        title: controller.signUpProcess[controller.selectedProcess.value],
        child: Column(
          children: [
            WidgetsUtil.verticalSpace24,
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.signUpProcess.length,
                onPageChanged: (value) {
                  controller.selectedProcess.value = value;
                },
                itemBuilder: (context, index) {
                  return getTextField(index);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 8,
                right: 24,
              ),
              alignment: Alignment.centerRight,
              child: TitleText(
                text: '${controller.selectedProcess.value + 1} of 3',
                size: Constants.regularText,
                weight: FontWeight.w500,
                textColor: Constants.royalBlue,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Constants.royalBlue,
                ),
                value: (controller.selectedProcess.value + 1) / 3,
                backgroundColor: Constants.royalBlue.withOpacity(0.3),
              ),
            ),
            WidgetsUtil.verticalSpace24,
            CustomButton(
              text: controller.selectedProcess.value == 2 ? 'Sign Up' : 'Next',
              onPressed: () {
                if (controller.selectedProcess.value !=
                    controller.signUpProcess.length - 1) {
                  controller.selectedProcess++;
                  controller.pageController.animateToPage(
                    controller.selectedProcess.value,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInCirc,
                  );
                }
              },
            ),
            WidgetsUtil.verticalSpace24,
          ],
        ),
      ),
    );
  }

  Widget getTextField(int index) {
    if (index == 0) {
      return CustomTextField(
        label: 'Email Address',
        hint: 'Your email address',
        prefixIcon: Assets.mail,
      );
    } else if (index == 1) {
      return CustomTextField(
        label: 'Password',
        hint: 'Your password',
        prefixIcon: Assets.password,
        suffixIcon: Assets.eye,
        onSuffixTap: () {},
      );
    } else {
      return CustomTextField(
        label: 'Username',
        hint: 'Your username',
        prefixIcon: Assets.person,
      );
    }
  }
}
