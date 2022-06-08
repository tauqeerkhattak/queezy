import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/title_text.dart';

class VoiceNote extends StatelessWidget {
  const VoiceNote({Key? key}) : super(key: key);

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
        InkWell(
          onTap: () {
            log('Add voice note');
          },
          child: Container(
            height: kBottomNavigationBarHeight,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Constants.cardsRadius,
              ),
              border: Border.all(
                color: Constants.grey5,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                WidgetsUtil.horizontalSpace8,
                Expanded(
                  flex: 8,
                  child: TitleText(
                    text: 'Add voice answer',
                    size: Constants.bodyNormal,
                    textColor: Constants.grey2,
                    weight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    Assets.mic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
