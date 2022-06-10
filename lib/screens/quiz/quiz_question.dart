import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/quiz_controller.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class QuizQuestion extends StatelessWidget {
  final controller = Get.find<QuizController>();
  QuizQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size(
          Get.width,
          kBottomNavigationBarHeight,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      color: Constants.secondaryColor,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          Assets.person,
                          color: Constants.white,
                          width: 16,
                          height: 16,
                        ),
                        TitleText(
                          text: '1',
                          size: Constants.bodyXSmall,
                          textColor: Constants.white,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Constants.white,
                      borderRadius: BorderRadius.circular(
                        24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
