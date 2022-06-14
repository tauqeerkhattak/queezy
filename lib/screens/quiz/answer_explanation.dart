import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:queezy/controllers/answer_explanation_controller.dart';
import 'package:queezy/screens/quiz/checkbox.dart';
import 'package:queezy/widgets/social_button.dart';

import '../../utils/assets.dart';
import '../../utils/constants.dart';
import '../../utils/widgets_util.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/title_text.dart';

class AnswerExplanation extends StatelessWidget {
  final controller = Get.put(AnswerExplanationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 70.0),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(
                  text: "Answers Explanation",
                  textColor: Constants.white,
                  size: 24,
                  weight: FontWeight.w500,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                  color: Constants.white,
                  iconSize: 40,
                )
              ],
            ),
          )),
      backgroundColor: Constants.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: CustomCard(
              height: Get.height - kBottomNavigationBarHeight,
              padding:
                  const EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(
                            text: "QUESTION 6 OF 10",
                            textColor: Constants.grey2,
                          ),
                          WidgetsUtil.verticalSpace8,
                          TitleText(
                            text: "How to pronounce Wojciech Szczesny?",
                            size: Constants.bodyXLarge,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TitleText(
                            text: "VOICE ANSWER",
                            size: 14,
                            weight: FontWeight.w500,
                            textColor: Constants.grey2,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 370,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Constants.lightgreen,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(children: [
                              const SizedBox(
                                width: 23,
                              ),
                              Expanded(
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      controller.playAudio();
                                    },
                                    child: Icon(
                                      controller.isPlaying.value
                                          ? Icons.play_arrow_rounded
                                          : Icons.pause,
                                      color: Constants.white,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              TitleText(
                                text: "voy · chek shez · nee",
                                textColor: Constants.white,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor:
                                      Constants.white.withAlpha(100),
                                  child: Icon(
                                    Icons.check,
                                    color: Constants.white,
                                    size: 20,
                                  ),
                                ),
                              )
                            ]),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TitleText(
                            text: "EXPLANATION",
                            size: 14,
                            weight: FontWeight.w500,
                            textColor: Constants.grey2,
                          ),
                          SizedBox(height: 8),
                          TitleText(
                            text:
                                "Pronunciation	English: /\u0027v\u0186\u0036t\U01A9ɛx/ VOY-chekh Polish: [\u0076v\u006Ajt\u0255\u025Bx] ( listen)",
                            size: 16,
                            weight: FontWeight.w400,
                            textColor: Constants.black1,
                            lineHeight: 1.5,
                          ),
                          SizedBox(height: 16),
                          TitleText(
                            text: "Gender:	male",
                            size: 16,
                          ),
                          SizedBox(height: 16),
                          TitleText(
                            text: "Word/name	origin: Polish",
                            size: 16,
                          ),
                          Expanded(
                              child: SocialButton(
                            onTap: (() {
                              Get.to(() => CheckBox());
                            }),
                            text: "Next",
                            textColor: Constants.white,
                            height: 56,
                            verticalMargin: Get.height * 0.2,
                            horizontalMargin: Get.width * 0,
                            background: Constants.primaryColor,
                            showBorder: false,
                          ))
                        ]),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
