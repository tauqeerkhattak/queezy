import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_checkbox.dart';
import 'package:queezy/widgets/custom_dialog.dart';
import 'package:queezy/widgets/custom_text_field.dart';

class CheckboxAnswer extends StatelessWidget {
  final bool checkValue;
  final Function(bool?) onChanged;
  const CheckboxAnswer({
    Key? key,
    required this.checkValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Add Question',
          textSize: Constants.bodyNormal,
          horizontalMargin: 16,
          iconTextColor: Constants.black1,
          titleWeight: FontWeight.w500,
          showBorder: true,
          borderColor: Constants.grey5,
          hint: 'Enter your question',
        ),
        WidgetsUtil.verticalSpace16,
        check(),
        WidgetsUtil.verticalSpace16,
        check(),
      ],
    );
  }

  Widget check() {
    return InkWell(
      onTap: () {
        CustomDialog.showCheckBoxDialog();
      },
      child: IgnorePointer(
        child: CustomCheckbox(
          horizontalMargin: 16,
          value: CustomDialog.value,
          onChanged: (value) {
            CustomDialog.value = value!;
          },
        ),
      ),
    );
  }
}
