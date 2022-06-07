import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as SvgProvider;
import 'package:get/get.dart';
import 'package:queezy/widgets/title_text.dart';

import '../utils/assets.dart';
import '../utils/constants.dart';
import '../utils/style_properties.dart';
import '../utils/widgets_util.dart';

class InfoCard extends StatelessWidget {
  final bool topPicksCard;
  final bool recentQuizCard;
  final bool featuredCard;
  final bool rankerCard;
  final num? quizzesLength;
  final num? points;
  final String? rankerName;
  const InfoCard({
    Key? key,
    this.featuredCard = false,
    this.points,
    this.quizzesLength,
    this.rankerCard = false,
    this.rankerName,
    this.recentQuizCard = false,
    this.topPicksCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(rankerCard);
    if (topPicksCard)
      return _topPicks();
    else if (featuredCard)
      return _featured();
    else if (rankerCard) return _ranker();
    return _recentQuiz();
  }

  Widget _topPicks() => Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          // CARD BACKGROUND
          Container(
            margin: StyleProperties.insetsHzt20,
            width: double.infinity,
            height: Get.height * 0.23,
            clipBehavior: Clip.antiAlias,
            decoration: StyleProperties.blueBox,
            child: SvgPicture.asset(Assets.topPicks,
                fit: BoxFit.fitWidth, alignment: Alignment.bottomRight),
          ),

          // TOP TIPS TEXT BOX
          Positioned(
            left: 40,
            top: 20,
            child: Container(
              decoration: StyleProperties.pinkBox,
              padding: StyleProperties.insets10,
              child: TitleText(
                text: "Top picks".toUpperCase(),
                textColor: Constants.white,
                weight: FontWeight.w500,
              ),
            ),
          ),

          // BOTTOM TEXT
          Positioned(
            left: 40,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  text: "Travel Trivia Quiz",
                  textColor: Constants.secondaryTextColor,
                  weight: FontWeight.w500,
                  size: Constants.bodyNormal,
                ),
                Padding(
                  padding: StyleProperties.topInset6,
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.travel,
                          color: Constants.secondaryTextColor,
                          height: Constants.bodyNormal),
                      WidgetsUtil.horizontalSpace8,
                      TitleText(
                        text: "Music • $quizzesLength Quizzes",
                        textColor: Constants.secondaryTextColor,
                        // weight: FontWeight.w500,
                        size: Constants.bodyXSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget _recentQuiz() => SizedBox();

  Widget _featured() => SizedBox();

  Widget _ranker() => Container(
        decoration: BoxDecoration(
            borderRadius: StyleProperties.cardsRadius,
            image: DecorationImage(image: SvgProvider.Svg(Assets.rankerCardBg)
                // image: Image(
                //   // width: 32,
                //   // height: 32,
                //   image: Svg('assets/my_icon.svg'),
                // )
                )),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    text: "$rankerName",
                    textColor: Constants.white,
                    weight: FontWeight.w500,
                    size: Constants.bodyNormal,
                  ),
                  Padding(
                      padding: StyleProperties.topInset6,
                      child: TitleText(
                        text: "$points points",
                        textColor: Constants.white,
                        // weight: FontWeight.w500,
                        size: Constants.bodyXSmall,
                      )),
                ],
              ),
            )
          ],
        ),
      );
}
