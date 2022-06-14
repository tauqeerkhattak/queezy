import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/home_controller.dart';
import 'package:queezy/routes/app_routes.dart';
import 'package:queezy/screens/quiz/quiz.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/style_properties.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/pie_chart.dart';
import 'package:queezy/widgets/quiz_category_card.dart';
import 'package:queezy/widgets/social_button.dart';
import 'package:queezy/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Constants.primaryColor,
      child: Column(
        children: [
          //AppBar
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 50,
              bottom: 10,
            ),
            height: kToolbarHeight,
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: 'Good Morning',
                        textColor: Constants.accent1,
                        size: Constants.bodyXSmall,
                        weight: FontWeight.w500,
                      ),
                      TitleText(
                        text: 'Madelyn Dias',
                        textColor: Constants.white,
                        size: Constants.heading3,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundColor: Constants.pink,
                  ),
                ),
              ],
            ),
          ),
          //Body
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 84,
                  width: Get.width,
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.swivels,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Constants.secondaryAccent,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WidgetsUtil.verticalSpace16,
                              TitleText(
                                text: 'Recent Quiz'.toUpperCase(),
                                size: Constants.bodySmall,
                                weight: FontWeight.w500,
                                textColor: Constants.secondaryTextColor,
                              ),
                              WidgetsUtil.verticalSpace8,
                              Row(
                                children: [
                                  Icon(
                                    Icons.headphones,
                                    color: Constants.secondaryTextColor,
                                  ),
                                  WidgetsUtil.horizontalSpace8,
                                  TitleText(
                                    text: 'A Basic Music Quiz',
                                    size: Constants.bodyLarge,
                                    weight: FontWeight.w500,
                                    textColor: Constants.secondaryTextColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: CustomPieChart(
                          value1: 88,
                          value2: 12,
                          radius: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                WidgetsUtil.verticalSpace24,
                Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Constants.grey3.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(Assets.cardCircles),
                    ),
                  ),
                  child: Column(
                    children: [
                      WidgetsUtil.verticalSpace16,
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: SvgPicture.asset(
                              Assets.man5,
                              height: 48,
                              width: 48,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Center(
                              child: TitleText(
                                text: 'Featured'.toUpperCase(),
                                size: Constants.bodySmall,
                                textColor: Constants.white,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: TitleText(
                          text:
                              'Take part in challenges with friends or other players',
                          size: Constants.bodyLarge,
                          align: TextAlign.center,
                          weight: FontWeight.w500,
                          textColor: Constants.white,
                        ),
                      ),
                      WidgetsUtil.verticalSpace16,
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 9,
                              child: SocialButton(
                                textColor: Constants.primaryColor,
                                iconColor: Constants.primaryColor,
                                background: Constants.white,
                                icon: Assets.search,
                                itemSpace: 12,
                                onTap: () => log('Find Friends'),
                                height: 44,
                                text: 'Find Friends',
                                showBorder: true,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              Assets.woman2,
                              height: 48,
                              width: 48,
                            ),
                            WidgetsUtil.horizontalSpace16,
                          ],
                        ),
                      ),
                      WidgetsUtil.verticalSpace16,
                    ],
                  ),
                ),
                WidgetsUtil.verticalSpace24,
                Container(
                  decoration: StyleProperties.sheetBorder,
                  padding: StyleProperties.insetsBottom80Hzt20,
                  child: Column(
                    children: [
                      WidgetsUtil.verticalSpace24,
                      Row(
                        children: [
                          TitleText(
                            text: 'Live Quizzes',
                            size: Constants.bodyXLarge,
                            textColor: Constants.black1,
                            weight: FontWeight.w500,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => log('See All'),
                            child: TitleText(
                              text: 'See All',
                              textColor: Constants.primaryColor,
                              size: Constants.bodySmall,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      WidgetsUtil.verticalSpace16,
                      ...List.generate(3, (index) {
                        return QuizCategoryCard(
                          name: 'Statistics Math Quiz',
                          asset: Assets.quizTypes[index],
                          category: 'Math',
                          quizNumber: index * 2,
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
