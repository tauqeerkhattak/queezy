import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_appbar.dart';
import 'package:queezy/widgets/custom_text_field.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Constants.primaryColor,
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            // Container(
            //   height: AppBar().preferredSize.height,
            //   margin: const EdgeInsets.only(
            //     left: 24,
            //     right: 24,
            //     // top: 24,
            //   ),
            //   child: Center(
            //     child: Row(
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             log('Back button');
            //           },
            //           child: Image.asset(
            //             Assets.backIcon,
            //             height: 24,
            //             width: 24,
            //             color: Constants.primaryTextColor,
            //           ),
            //         ),
            //         const Spacer(),
            //         TitleText(
            //           text: 'Discover',
            //           size: Constants.heading3,
            //           textColor: Constants.primaryTextColor,
            //           weight: FontWeight.w500,
            //         ),
            //         const Spacer(),
            //       ],
            //     ),
            //   ),
            // ),
            CustomAppBar(
              title: 'Discover',
              onBackTapped: () => log('OnBackTapped'),
            ),
            WidgetsUtil.verticalSpace16,
            CustomTextField(
              hint: 'Quiz, categories, or friends',
              fillColor: Constants.black1.withOpacity(0.16),
              prefixIcon: Assets.search,
              // showBorder: false,
            ),
          ],
        ),
      ),
    );
  }
}
