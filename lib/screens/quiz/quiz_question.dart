import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/controllers/quiz_controller.dart';
import 'package:queezy/screens/quiz/type_answerscreen.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/pie_chart.dart';
import 'package:queezy/widgets/question_types/type_answer.dart';
import 'package:queezy/widgets/title_text.dart';

import '../../utils/widgets_util.dart';

class QuizQuestion extends StatelessWidget {
  final controller = Get.find<QuizController>();
  QuizQuestion({Key? key}) : super(key: key);

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
                    flex: 5,
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
                    flex: 7,
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
                              text: "35",
                              textColor: Constants.white,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            )),
        body: CustomCard(
            height: Get.height - kBottomNavigationBarHeight,
            padding:
                const EdgeInsets.only(top: 110, bottom: 8, left: 8, right: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
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
                            text: "QUESTION 3 OF 10",
                            textColor: Constants.grey2,
                          ),
                          WidgetsUtil.verticalSpace8,
                          TitleText(
                            text:
                                "Which player scored the fastest hat-trick in the Premier League?",
                            size: Constants.bodyXLarge,
                            weight: FontWeight.w500,
                          ),
                          Container(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              padding: EdgeInsets.all(10),
                              shrinkWrap: true,
                              itemCount: controller.answers.length,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      controller.selectedIndex.value = index;
                                      Get.to((TypeAnswerScreen()));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color:
                                              controller.selectedIndex.value ==
                                                      index
                                                  ? Constants.grey3
                                                  : Constants.white,
                                          border: Border.all(
                                            color: Constants.grey5,
                                            style: BorderStyle.solid,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      height: 56,
                                      child: TitleText(
                                        text: controller.answers[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            )));
  }
}
