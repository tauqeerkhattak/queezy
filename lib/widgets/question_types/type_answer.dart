import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_text_field.dart';

class TypeAnswer extends StatelessWidget {
  const TypeAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Add Question',
          hint: 'Enter your question',
          horizontalMargin: 16,
          textSize: Constants.bodyNormal,
          iconTextColor: Constants.black2,
          titleWeight: FontWeight.w500,
          showBorder: true,
          borderColor: Constants.grey5,
        ),
        WidgetsUtil.verticalSpace8,
        CustomTextField(
          hint: 'Add answer',
          showBorder: true,
          borderColor: Constants.grey5,
          horizontalMargin: 16,
          maxLines: 3,
        ),
        WidgetsUtil.verticalSpace8,
      ],
    );
  }
}
