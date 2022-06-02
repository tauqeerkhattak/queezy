import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/widgets/category_card.dart';
import 'package:queezy/widgets/info_card.dart';

import '../../utils/assets.dart';
import '../../utils/constants.dart';
import '../../utils/style_properties.dart';
import '../../utils/widgets_util.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/title_text.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.royalBlue,
      width: Get.width,
      height: Get.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            title: 'Discover',
            onBackTapped: () => print('OnBackTapped'),
          ),
          WidgetsUtil.verticalSpace16,
          CustomTextField(
            hint: 'Quiz, categories, or friends',
            fillColor: Constants.black2.withOpacity(0.2),
            prefixIcon: Assets.search,
            showBorder: false,
          ),
          WidgetsUtil.verticalSpace24,
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  // TOP PICKS

                  flexibleSpace: Center(
                    child: InfoCard(
                      topPicksCard: true,
                      quizzesLength: 5,
                    ),
                  ),
                  collapsedHeight: 170,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  leading: SizedBox(),
                ),
                // _sheet(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      _sheet(),
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

  Widget _sheet() => Container(
        decoration: StyleProperties.sheetBorder,
        padding: StyleProperties.insetsBottom80Hzt20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _heading("Top rank of the week"),
            _ranker(
              rankerCard: true,
              rankerName: "Brandon Matrovs",
              points: 124,
            ),
            _heading("Categories"),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(Assets.quizTypes.length, (index) {
                return CategoryCard(
                  color: Constants.tulip,
                  icon: Assets.quizTypes[index],
                  categoryName: "Math",
                  quizzes: 21,
                );
              }),
            ),
          ],
        ),
      );

  Widget _heading(String text) => Padding(
        padding: StyleProperties.insetsVrt20,
        child: TitleText(
          text: text,
          size: Constants.heading3,
          weight: FontWeight.w500,
        ),
      );

  Widget _ranker({rankerCard, rankerName, points}) => Container(
        decoration: BoxDecoration(
          color: Constants.royalBlue,
          borderRadius: StyleProperties.cardsRadius,
          //TODO
          // image: DecorationImage(
          //   image: SvgProvider.Svg(Assets.rankerCardBg),
          //   fit: BoxFit.cover,
          // ),
        ),
        padding: StyleProperties.insets15,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.white,
                ),
              ),
              padding: StyleProperties.insets10,
              margin: StyleProperties.rightInset15,
              child: TitleText(
                text: "1",
                size: Constants.extraSmallText,
                textColor: Constants.white,
                weight: FontWeight.w500,
              ),
            ),
            //TODO
            // SvgPicture.asset(
            //   Assets.avatar_1,
            //   height: 70,
            // ),
            WidgetsUtil.horizontalSpace16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    text: "$rankerName",
                    textColor: Constants.white,
                    weight: FontWeight.w500,
                    size: Constants.largeText,
                    // lineHeight: 2.0,
                    align: TextAlign.center,
                  ),
                  Padding(
                    padding: StyleProperties.topInset10,
                    child: TitleText(
                      text: "$points points",
                      textColor: Constants.white,
                      // weight: FontWeight.w500,
                      size: Constants.regularText,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
