import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/title_text.dart';

///Cover image to be used for the whole quiz or just a specific question.
class CoverImage extends StatelessWidget {
  final controller = Get.find<CreateController>();
  CoverImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('Pick Image!');
      },
      child: Obx(
        () => Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Constants.grey5,
            borderRadius: BorderRadius.circular(
              Constants.cardsRadius,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          width: Get.width,
          height: 200,
          child: controller.image.value != null
              ? Image.file(
                  File(
                    controller.image.value!.path,
                  ),
                  fit: BoxFit.cover,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.selectedPicture,
                    ),
                    WidgetsUtil.verticalSpace8,
                    TitleText(
                      text: 'Add Cover Image',
                      size: Constants.bodyNormal,
                      weight: FontWeight.w500,
                      textColor: Constants.primaryColor,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
