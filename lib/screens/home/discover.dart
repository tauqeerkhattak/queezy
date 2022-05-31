
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as SvgProvider;
import 'package:get/get.dart';

import '../../utils/assets.dart';
import '../../utils/constants.dart';
import '../../utils/style_properties.dart';
import '../../utils/widgets_util.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/info_card.dart';
import '../../widgets/title_text.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.royalBlue,
      // padding: StyleProperties.insetsVrt20Hzt20,
      child: SizedBox(
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

            // TOP PICKS CARD
            InfoCard(
              topPicksCard: true,
              quizzesLength: 5,
            ),

            WidgetsUtil.verticalSpace24,

            _sheet(),

          ],
        ),
      ),
    );
  }

  Widget _sheet() => SingleChildScrollView(
    child: Container(
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
        ],
      ),
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
        image: DecorationImage(
            image: SvgProvider.Svg(Assets.rankerCardBg),
          fit: BoxFit.cover
        )
    ),
    padding: StyleProperties.insets15,
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Constants.white)
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

        SvgPicture.asset(
            Assets.avatar_1,
          height: 70,
        ),
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
                  )
              ),
            ],
          ),
        )
      ],
    ),
  );
}
