import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:queezy/controllers/answer_explanation_controller.dart';
import 'package:queezy/screens/quiz/checkbox.dart';
import 'package:queezy/widgets/line_chart.dart';
import 'package:queezy/widgets/social_button.dart';

import '../../utils/assets.dart';
import '../../utils/constants.dart';
import '../../utils/widgets_util.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/title_text.dart';

class CompleteScreen extends StatelessWidget {
  final controller = Get.put(AnswerExplanationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 70.0),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                ),
                TitleText(
                  text: "Good Job",
                  textColor: Constants.black1,
                  size: 24,
                  weight: FontWeight.w500,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                  color: Constants.black1,
                  iconSize: 40,
                )
              ],
            ),
          )),
      backgroundColor: Constants.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: Constants.pink,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(children: [
              WidgetsUtil.verticalSpace24,
              Image.asset(Assets.cupIllustration),
              WidgetsUtil.verticalSpace24,
              TitleText(
                text: "You get +80 Quiz Points",
                size: 16,
                weight: FontWeight.w500,
                textColor: Constants.white,
              ),
              WidgetsUtil.verticalSpace24,
              SocialButton(
                  background: Constants.white.withOpacity(0.3),
                  textColor: Constants.white,
                  onTap: () {},
                  text: "Check Correct Answer",
                  showBorder: false),
              WidgetsUtil.verticalSpace24,
            ]),
          ),
          WidgetsUtil.verticalSpace24,
          TitleText(
            text: "Accuration Answer",
            size: 12,
            weight: FontWeight.w500,
            textColor: Constants.grey2,
          ),
          WidgetsUtil.verticalSpace16,
          SizedBox(
              height: 70,
              child: CustomLineChart(linearbardata: [
                LineChartBarData(
                    belowBarData: BarAreaData(
                        color: Constants.primaryColor.withOpacity(0.06),
                        show: true),
                    dotData: FlDotData(show: false),
                    color: Constants.primaryColor,
                    spots: [
                      FlSpot(1, 0.5),
                      FlSpot(2, 0.5),
                      FlSpot(2.9, 0.3),
                      FlSpot(4, 1),
                      FlSpot(5, 1),
                      FlSpot(5.3, 0.5),
                      FlSpot(6.5, 0.5),
                      FlSpot(7.3, 1),
                      FlSpot(8.1, 0.5),
                      FlSpot(9.1, 0.5),
                      FlSpot(10, 0),
                    ]),
              ])),
          WidgetsUtil.verticalSpace24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(text: "CORRECT ANSWER"),
              TitleText(text: "COMPLETION")
            ],
          ),
          WidgetsUtil.verticalSpace8,
          Row(
            children: [],
          ),
          WidgetsUtil.verticalSpace16,
          Row(
            children: [],
          ),
          WidgetsUtil.verticalSpace8,
          Row(
            children: [],
          ),
          WidgetsUtil.verticalSpace24,
          Row(
            children: [],
          ),
        ]),
      ),
    );
  }
}
