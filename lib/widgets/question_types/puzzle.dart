import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_text_field.dart';

class Puzzle extends StatelessWidget {
  const Puzzle({Key? key}) : super(key: key);

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
        getPuzzleAnswer(),
        WidgetsUtil.verticalSpace8,
        getPuzzleAnswer(),
        WidgetsUtil.verticalSpace8,
        getPuzzleAnswer(),
        WidgetsUtil.verticalSpace8,
      ],
    );
  }

  Widget getPuzzleAnswer() {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: CustomTextField(
              showBorder: true,
              hint: 'Add answer',
              horizontalMargin: 16,
              borderColor: Constants.grey5,
            ),
          ),
          InkWell(
            onTap: () {
              log('Equals to');
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 16,
              ),
              child: Icon(
                CupertinoIcons.equal,
                size: 30,
                color: Constants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
