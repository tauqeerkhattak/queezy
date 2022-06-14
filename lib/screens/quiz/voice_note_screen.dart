import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/screens/quiz/answer_explanation.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/pie_chart.dart';
import 'package:queezy/widgets/title_text.dart';

import '../../utils/widgets_util.dart';

class VoiceNoteScreen extends StatelessWidget {
  const VoiceNoteScreen({Key? key}) : super(key: key);

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
                    flex: 6,
                    child: Container(
                      height: 4,
                      width: 88,
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
                      width: 148,
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
                              text: "20",
                              textColor: Constants.white,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            )),
        body: CustomCard(
          padding:
              const EdgeInsets.only(top: 110, bottom: 8, left: 8, right: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Expanded(
                flex: 2,
                child: const CustomPieChart(
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
                        text: "QUESTION 6 OF 10",
                        textColor: Constants.grey2,
                      ),
                      WidgetsUtil.verticalSpace8,
                      TitleText(
                        text: "How to pronounce Wojciech Szczesny?",
                        size: Constants.bodyXLarge,
                        weight: FontWeight.w500,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (() => Get.to(() => AnswerExplanation())),
                            child: Container(
                                padding: const EdgeInsets.all(50),
                                child: Image.asset(Assets.micIcon)),
                          ),
                          TitleText(
                            text: "Hold to speak",
                            textColor: Constants.grey2,
                          )
                        ],
                      ),
                    ]),
              ),
            ]),
          ),
        ));
  }
}

curve(icon, height) {
  return Container(
    child: Image.asset(
      icon,
      height: 150,
    ),
  );
}
