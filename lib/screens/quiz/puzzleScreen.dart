import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/controllers/quiz_controller.dart';
import 'package:queezy/screens/quiz/complete.dart';
import 'package:queezy/screens/quiz/type_answerscreen.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/optionContainer.dart';
import 'package:queezy/widgets/pie_chart.dart';
import 'package:queezy/widgets/question_types/type_answer.dart';
import 'package:queezy/widgets/title_text.dart';

import '../../utils/widgets_util.dart';

class PuzzleScreen extends StatelessWidget {
  PuzzleScreen({Key? key}) : super(key: key);

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
                    child: GestureDetector(
                      onTap: (() => Get.to(CompleteScreen())),
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
                                text: "40",
                                textColor: Constants.white,
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )),
        body: CustomCard(
            padding: EdgeInsets.only(top: 110, bottom: 8, left: 8, right: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: CustomPieChart(
                      value1: 30,
                      value2: 70,
                      radius: 35,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: Get.width,
                            child: Image.asset(Assets.hellicopterIllustration)),
                        WidgetsUtil.verticalSpace32,
                        TitleText(
                          text: "QUESTION 9 OF 10",
                          textColor: Constants.grey2,
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                        WidgetsUtil.verticalSpace8,
                        TitleText(
                          text: "What does UAV stand for drone?",
                          weight: FontWeight.w500,
                          size: 20,
                        ),
                        WidgetsUtil.verticalSpace24,
                        OptionContainer(
                            height: Get.height * 0.09,
                            child: TitleText(
                              text: "Unmanned Aerial Vehicle",
                              weight: FontWeight.w500,
                              size: 16,
                            )),
                        WidgetsUtil.verticalSpace24,
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            OptionContainer(
                              height: Get.height * 0.09,
                              width: 100,
                              child: TitleText(
                                text: "Under",
                              ),
                            ),
                            Badge(
                              position: BadgePosition(
                                top: 4,
                                end: 5,
                              ),
                              elevation: 0,
                              badgeColor: Colors.transparent,
                              badgeContent: Text('1'),
                              child: OptionContainer(
                                  height: Get.height * 0.09,
                                  color:
                                      Constants.primaryColor.withOpacity(0.2),
                                  width: 140,
                                  child: TitleText(
                                    text: "Unmanned",
                                    weight: FontWeight.w500,
                                    size: 16,
                                  )),
                            ),
                            OptionContainer(
                                height: Get.height * 0.09,
                                width: 70,
                                child: TitleText(text: "Air")),
                            Badge(
                              position: BadgePosition(
                                top: 4,
                                end: 5,
                              ),
                              elevation: 0,
                              badgeColor: Colors.transparent,
                              badgeContent: Text('2'),
                              child: OptionContainer(
                                  height: Get.height * 0.09,
                                  width: 110,
                                  child: TitleText(
                                    text: "Aerial",
                                    weight: FontWeight.w500,
                                    size: 16,
                                  ),
                                  color:
                                      Constants.primaryColor.withOpacity(0.2)),
                            ),
                            Badge(
                              position: BadgePosition(
                                top: 4,
                                end: 5,
                              ),
                              elevation: 0,
                              badgeColor: Colors.transparent,
                              badgeContent: Text('3'),
                              child: OptionContainer(
                                  height: Get.height * 0.09,
                                  color:
                                      Constants.primaryColor.withOpacity(0.2),
                                  width: 120,
                                  child: TitleText(
                                    text: "Vehicle",
                                    weight: FontWeight.w500,
                                    size: 16,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )));
  }
}
