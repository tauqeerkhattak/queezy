import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/controllers/quiz_controller.dart';
import 'package:queezy/screens/quiz/poll.dart';
import 'package:queezy/screens/quiz/type_answerscreen.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/pie_chart.dart';
import 'package:queezy/widgets/question_types/type_answer.dart';
import 'package:queezy/widgets/title_text.dart';

import '../../utils/widgets_util.dart';

class CheckBox extends StatelessWidget {
  final controller = Get.find<QuizController>();
  CheckBox({Key? key}) : super(key: key);

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
                    flex: 7,
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
                    flex: 5,
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
                      onTap: () => Get.to(PollScreen()),
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
            padding: EdgeInsets.only(top: 112, bottom: 8, left: 8, right: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: CustomPieChart(
                      value1: 80,
                      value2: 20,
                      radius: 35,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(
                            text: "QUESTION 7 OF 10",
                            textColor: Constants.grey2,
                          ),
                          WidgetsUtil.verticalSpace8,
                          TitleText(
                            text:
                                "Which three players shared the Premier League Golden Boot in 2018-19?",
                            size: Constants.bodyXLarge,
                            weight: FontWeight.w500,
                          ),
                          Container(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 16,
                                );
                              },
                              padding: EdgeInsets.all(10),
                              shrinkWrap: true,
                              itemCount: controller.checkboxanswers.length,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      controller.selectedIndex.value = index;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: controller.checkboxIndex[index]
                                              ? Constants.primaryColor
                                                  .withOpacity(0.2)
                                              : Constants.white,
                                          border: Border.all(
                                            color: Constants.grey5,
                                            style: BorderStyle.solid,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      height: 56,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              focusColor: Constants.grey5,
                                              checkColor: Constants.white,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      Constants.primaryColor),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              value: controller
                                                  .checkboxIndex[index],
                                              onChanged: (value) {
                                                controller
                                                        .checkboxIndex[index] =
                                                    value;
                                              }),
                                          TitleText(
                                            text: controller
                                                .checkboxanswers[index],
                                          ),
                                        ],
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
