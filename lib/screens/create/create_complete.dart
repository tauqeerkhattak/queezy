import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/notched_card.dart';
import 'package:queezy/widgets/notched_clip.dart';
import 'package:queezy/widgets/title_text.dart';

class CreateComplete extends StatelessWidget {
  const CreateComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Constants.primaryColor,
      title: 'Create Quiz',
      titleColor: Constants.white,
      child: ListView(
        children: [
          WidgetsUtil.verticalSpace24,
          illustration(),
          quizTitle(),
          WidgetsUtil.verticalSpace16,
          NotchedCard(
            child: Container(
              width: Get.width,
              height: 300,
              decoration: BoxDecoration(
                color: Constants.white,
                borderRadius: BorderRadius.circular(
                  Constants.cardsRadius,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget illustration() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
      ),
      child: SvgPicture.asset(
        Assets.laptopCatLady,
      ),
    );
  }

  Widget quizTitle() {
    return ClipPath(
      // clipBehavior: Clip.none,
      clipper: NotchedClip(),
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        decoration: BoxDecoration(
          color: Constants.white,
          borderRadius: BorderRadius.circular(
            Constants.cardsRadius,
          ),
        ),
        child: Column(
          children: [
            WidgetsUtil.verticalSpace24,
            Row(
              children: [
                WidgetsUtil.horizontalSpace16,
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.tech,
                        color: Constants.primaryColor,
                      ),
                      TitleText(
                        text: 'TECH • 5 QUIZZES',
                        size: Constants.bodyXSmall,
                        textColor: Constants.primaryColor,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    log('Edit Quiz');
                  },
                  child: SvgPicture.asset(
                    Assets.edit,
                  ),
                ),
                WidgetsUtil.horizontalSpace16,
              ],
            ),
            WidgetsUtil.verticalSpace24,
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TitleText(
                  text: 'Remote Work Tools Quiz',
                  size: Constants.bodyXLarge,
                  weight: FontWeight.w500,
                  textColor: Constants.black2,
                ),
              ),
            ),
            WidgetsUtil.verticalSpace8,
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: TitleText(
                text:
                    'Take this basic remote work tools quiz to test your tech knowledge.',
                size: Constants.bodyNormal,
                textColor: Constants.grey2,
                weight: FontWeight.w400,
              ),
            ),
            WidgetsUtil.verticalSpace24,
          ],
        ),
      ),
    );
  }
}
