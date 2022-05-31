import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_appbar.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/info_card.dart';

import '../../utils/style_properties.dart';
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
              onBackTapped: () => log('OnBackTapped'),
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


          ],
        ),
      ),
    );
  }


}
