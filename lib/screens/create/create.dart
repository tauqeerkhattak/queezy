import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/screens/create/choose_category.dart';
import 'package:queezy/screens/create/question.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/question_types/cover_image.dart';
import 'package:queezy/widgets/title_text.dart';

class Create extends StatelessWidget {
  final controller = Get.put(CreateController());
  Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Create Quiz',
      action: PopupMenuButton<String>(
        icon: Icon(
          Icons.more_horiz,
          color: Constants.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Constants.cardsRadius,
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              onTap: () {
                log('Duplicate');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.copy,
                    color: Constants.grey2,
                  ),
                  TitleText(
                    text: 'Duplicate',
                    size: Constants.bodyNormal,
                    textColor: Constants.grey2,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              onTap: () {
                log('Delete');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  TitleText(
                    text: 'Delete',
                    size: Constants.bodyNormal,
                    textColor: Colors.red,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ];
        },
      ),
      titleColor: Constants.white,
      backgroundColor: Constants.primaryColor,
      child: CustomCard(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 24,
          bottom: 8,
        ),
        child: Column(
          children: [
            Expanded(
              child: _body(),
            ),
            CustomButton(
              verticalMargin: 8,
              horizontalMargin: 16,
              text: 'Add Question',
              onPressed: () {
                Get.to(() => Question());
              },
            ),
            WidgetsUtil.verticalSpace8,
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          CoverImage(),
          CustomTextField(
            label: 'Title',
            hint: 'Enter quiz title',
            showBorder: true,
            borderColor: Constants.grey5,
            titleWeight: FontWeight.w500,
            textSize: Constants.bodyNormal,
          ),
          WidgetsUtil.verticalSpace16,
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: 24,
            ),
            child: TitleText(
              text: 'Category',
              weight: FontWeight.w500,
              size: Constants.bodyNormal,
              textColor: Constants.black2,
            ),
          ),
          WidgetsUtil.verticalSpace8,
          InkWell(
            onTap: () {
              Get.to(() => ChooseCategory());
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              height: kBottomNavigationBarHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Constants.grey5,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  Constants.cardsRadius,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetsUtil.horizontalSpace8,
                  TitleText(
                    text: 'Choose quiz category',
                    size: Constants.bodyNormal,
                    textColor: Constants.grey2,
                    weight: FontWeight.w400,
                  ),
                  const Spacer(),
                  Icon(
                    CupertinoIcons.forward,
                    color: Constants.black2,
                  ),
                  WidgetsUtil.horizontalSpace8,
                ],
              ),
            ),
          ),
          WidgetsUtil.verticalSpace16,
          CustomTextField(
            label: 'Description',
            hint: 'Enter quiz description',
            showBorder: true,
            maxLines: 5,
            borderColor: Constants.grey5,
            titleWeight: FontWeight.w500,
            textSize: Constants.bodyNormal,
          ),
        ],
      ),
    );
  }
}
