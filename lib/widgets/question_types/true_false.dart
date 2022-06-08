import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/title_text.dart';

class TrueFalse extends StatelessWidget {
  const TrueFalse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Add Question',
          hint: 'Enter your question',
          horizontalMargin: 16,
          textSize: Constants.bodyNormal,
          titleWeight: FontWeight.w500,
          iconTextColor: Constants.black1,
          showBorder: true,
          borderColor: Constants.grey5,
        ),
        WidgetsUtil.verticalSpace8,
        Row(
          children: [
            trueAnswer(),
            falseAnswer(),
          ],
        ),
      ],
    );
  }

  Widget trueAnswer() {
    return Expanded(
      child: Container(
        height: 92,
        margin: const EdgeInsets.only(
          left: 16,
          right: 8,
        ),
        decoration: BoxDecoration(
          color: Constants.accent2,
          borderRadius: BorderRadius.circular(
            Constants.cardsRadius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Constants.primaryColor,
            ),
            WidgetsUtil.verticalSpace8,
            TitleText(
              text: 'Add true Answer',
              size: Constants.bodySmall,
              weight: FontWeight.w500,
              textColor: Constants.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget falseAnswer() {
    return Expanded(
      child: Container(
        height: 92,
        margin: const EdgeInsets.only(
          left: 8,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: Constants.grey5,
          borderRadius: BorderRadius.circular(
            Constants.cardsRadius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Constants.primaryColor,
            ),
            WidgetsUtil.verticalSpace8,
            TitleText(
              text: 'Add false Answer',
              size: Constants.bodySmall,
              weight: FontWeight.w500,
              textColor: Constants.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
