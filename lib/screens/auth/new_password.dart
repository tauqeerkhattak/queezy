import 'package:flutter/cupertino.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/title_text.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'New Password',
      child: SingleChildScrollView(
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
                    'Your new password must be different from previous used passwords.',
                size: Constants.bodyNormal,
                weight: FontWeight.w400,
              ),
            ),
            WidgetsUtil.verticalSpace24,
            CustomTextField(
              label: 'New Password',
              hint: 'Password',
              prefixIcon: Assets.password,
              suffixIcon: Assets.closeEye,
            ),
            WidgetsUtil.verticalSpace16,
            CustomTextField(
              label: 'Confirm password',
              hint: 'Confirm Password',
              prefixIcon: Assets.password,
              suffixIcon: Assets.closeEye,
            ),
            CustomButton(
              text: 'Reset Password',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
