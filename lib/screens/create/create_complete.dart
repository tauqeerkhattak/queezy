import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:queezy/screens/quiz/quiz.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/notched_card.dart';
import 'package:queezy/widgets/notched_clip.dart';
import 'package:queezy/widgets/title_text.dart';

class CreateComplete extends StatelessWidget {
  CreateComplete({Key? key}) : super(key: key);
  final List<String> dummyQuestions = [
    'Which mathematical symbol was the title of Ed Sheeran’s first album in 2011?',
    'Bad Romance was Lady Gaga’s first No. 1 hit?',
    'What is the name of The Beatles’ first album?',
    'Who wrote the song \'Let\'s Get It On\'?',
    'Who was the 2 most streamed artist on Spotify in 2019?',
  ];
  final List<String> questionTypes = [
    'Multiple Choices',
    'True or False',
    'Type Answer',
    'Voice Note',
    'Checkbox',
  ];

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
          questions(),
          WidgetsUtil.verticalSpace24,
        ],
      ),
    );
  }

  NotchedCard questions() {
    return NotchedCard(
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Constants.white,
          borderRadius: BorderRadius.circular(
            Constants.cardsRadius,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                TitleText(
                  text: 'Questions',
                  size: Constants.bodyLarge,
                  textColor: Constants.black2,
                  weight: FontWeight.w500,
                ),
                const Spacer(),
                editIcon(),
              ],
            ),
            WidgetsUtil.verticalSpace16,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Constants.grey5,
                borderRadius: BorderRadius.circular(
                  Constants.cardsRadius,
                ),
              ),
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 24,
              ),
              child: Column(
                children: List.generate(
                  dummyQuestions.length,
                  (index) {
                    return singleQuestion(index);
                  },
                ),
              ),
            ),
            CustomButton(
              verticalMargin: 16,
              horizontalMargin: 0,
              text: 'Save',
              onPressed: () {
                log('Save pressed');
                Get.to(() => Quiz());
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding singleQuestion(int index) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Constants.white,
                  child: TitleText(
                    text: (index + 1).toString(),
                    size: Constants.bodyNormal,
                    weight: FontWeight.w500,
                    textColor: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                TitleText(
                  text: dummyQuestions[index],
                  size: Constants.bodySmall,
                  weight: FontWeight.w500,
                  textColor: Constants.black2,
                ),
                WidgetsUtil.verticalSpace8,
                Align(
                  alignment: Alignment.centerLeft,
                  child: TitleText(
                    text: questionTypes[index],
                    size: Constants.bodyXSmall,
                    weight: FontWeight.w400,
                    textColor: Constants.grey2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              Assets.quizTypes[index],
              height: 56,
              width: 56,
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
                        text: 'TECH • ${dummyQuestions.length} QUIZZES',
                        size: Constants.bodyXSmall,
                        textColor: Constants.primaryColor,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                editIcon(),
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

  Widget editIcon() {
    return InkWell(
      onTap: () {
        log('Edit Quiz');
      },
      child: SvgPicture.asset(
        Assets.edit,
      ),
    );
  }
}
