import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/quiz_controller.dart';
import 'package:queezy/screens/quiz/quiz_question.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/social_button.dart';
import 'package:queezy/widgets/title_text.dart';

class Quiz extends StatelessWidget {
  final controller = Get.put(QuizController());
  Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      expandBodyBehindAppBar: true,
      backgroundColor: Constants.primaryColor,
      titleColor: Constants.white,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: illustration(),
          ),
          Expanded(
            flex: 6,
            child: CustomCard(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 0,
                bottom: 8,
              ),
              child: quizInfo(),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox quizInfo() {
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              text: 'SPORTS',
              size: Constants.bodySmall,
              weight: FontWeight.w400,
              textColor: Constants.grey2,
            ),
            WidgetsUtil.verticalSpace8,
            TitleText(
              text: 'Basic Trivia Quiz',
              size: Constants.heading3,
              weight: FontWeight.w500,
              textColor: Constants.black2,
            ),
            WidgetsUtil.verticalSpace16,
            quizPoints(),
            WidgetsUtil.verticalSpace24,
            TitleText(
              text: 'Description'.toUpperCase(),
              weight: FontWeight.w500,
              size: Constants.bodySmall,
              textColor: Constants.grey2,
            ),
            WidgetsUtil.verticalSpace10,
            TitleText(
              text:
                  'Any time is a good time for a quiz and even better if that happens to be a football themed quiz!',
              size: Constants.bodyNormal,
              textColor: Constants.black2,
              weight: FontWeight.w400,
            ),
            WidgetsUtil.verticalSpace24,
            quizCreator(),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: SocialButton(
                    horizontalMargin: 0,
                    verticalMargin: 16,
                    textColor: Constants.primaryColor,
                    text: 'Play Solo',
                    onTap: () {
                      Get.to(() => QuizQuestion());
                    },
                    showBorder: true,
                  ),
                ),
                WidgetsUtil.horizontalSpace16,
                Expanded(
                  child: CustomButton(
                    verticalMargin: 16,
                    horizontalMargin: 0,
                    text: 'Play with Friends',
                    onPressed: () {
                      Get.to(() => QuizQuestion());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row quizCreator() {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.man3,
          width: 40,
          height: 40,
        ),
        WidgetsUtil.horizontalSpace8,
        WidgetsUtil.horizontalSpace8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TitleText(
              text: 'Brandon Curtis',
              size: Constants.bodySmall,
              weight: FontWeight.w500,
              textColor: Constants.black2,
            ),
            TitleText(
              text: 'Creator',
              size: Constants.bodyXSmall,
              textColor: Constants.grey2,
              weight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }

  Container quizPoints() {
    return Container(
      decoration: BoxDecoration(
        color: Constants.grey5,
        borderRadius: BorderRadius.circular(
          Constants.cardsRadius,
        ),
      ),
      padding: const EdgeInsets.all(
        16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: Constants.primaryColor,
              radius: 16,
              child: TitleText(
                text: '?',
                size: Constants.bodySmall,
                textColor: Constants.white,
                weight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: TitleText(
              text: '10 Questions',
              size: Constants.bodySmall,
              weight: FontWeight.w500,
              textColor: Constants.black2,
              align: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: Constants.pink,
              radius: 16,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  Assets.puzzleIcon,
                  color: Constants.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: TitleText(
              text: '+100 Points',
              size: Constants.bodySmall,
              textColor: Constants.black2,
              weight: FontWeight.w500,
              align: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget illustration() {
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -70,
            child: SvgPicture.asset(
              Assets.smallCircle,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              Assets.manPushingBox,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
