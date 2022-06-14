import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/controllers/quiz_controller.dart';
import 'package:queezy/screens/quiz/puzzleScreen.dart';
import 'package:queezy/screens/quiz/type_answerscreen.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/optionContainer.dart';
import 'package:queezy/widgets/pie_chart.dart';
import 'package:queezy/widgets/question_types/type_answer.dart';
import 'package:queezy/widgets/title_text.dart';

import '../../utils/widgets_util.dart';

class PollScreen extends StatelessWidget {
  final controller = Get.find<QuizController>();
  PollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Constants.primaryColor,
        appBar: PreferredSize(
            preferredSize: Size(
              Get.width,
              kBottomNavigationBarHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 52,
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
                    flex: 8,
                    child: Container(
                      height: 4,
                      width: 148,
                      margin: const EdgeInsets.only(
                        left: 30,
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
                    flex: 4,
                    child: Container(
                      height: 4,
                      width: 44,
                      margin: const EdgeInsets.only(
                        left: 0,
                        right: 50,
                      ),
                      decoration: BoxDecoration(
                        color: Constants.secondaryColor,
                        borderRadius: BorderRadius.circular(
                          24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        height: 34,
                        decoration: BoxDecoration(
                          color: Constants.orange,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              Assets.puzzleIcon1,
                              color: Constants.white,
                              width: 16,
                              height: 16,
                            ),
                            TitleText(
                              text: "25",
                              textColor: Constants.white,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            )),
        body: CustomCard(
            padding: EdgeInsets.only(top: 110, bottom: 8, left: 8, right: 8),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  const Expanded(
                    flex: 2,
                    child: CustomPieChart(
                      value1: 60,
                      value2: 40,
                      radius: 35,
                    ),
                  ),
                  Expanded(
                      flex: 8,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleText(
                              text: "QUESTION 8 OF 10",
                              textColor: Constants.grey2,
                            ),
                            WidgetsUtil.verticalSpace8,
                            TitleText(
                              text: "What is the best club in England?",
                              size: Constants.bodyXLarge,
                              weight: FontWeight.w500,
                            ),
                            WidgetsUtil.verticalSpace24,
                            GestureDetector(
                              onTap: () => Get.to(PuzzleScreen()),
                              child: Container(
                                  height: Get.height * 0.08,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Constants.grey5,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      OptionContainer(
                                          width: Get.width * 0.70,
                                          color: Constants.primaryColor
                                              .withOpacity(0.2),
                                          child: TitleText(
                                            text: "Manchester United",
                                            weight: FontWeight.w500,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: TitleText(text: "92%"),
                                      ),
                                    ],
                                  )),
                            ),
                            WidgetsUtil.verticalSpace16,
                            OptionContainer(
                                child: TitleText(text: "Leeds United")),
                            WidgetsUtil.verticalSpace16,
                            OptionContainer(child: TitleText(text: "Fulham")),
                            WidgetsUtil.verticalSpace16,
                            OptionContainer(
                                child: TitleText(text: "Leicester City")),
                          ])),
                ]))));
  }
}
