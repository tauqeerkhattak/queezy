import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/model/category_item.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/category_card.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/default_layout.dart';

class ChooseCategory extends StatelessWidget {
  final controller = Get.find<CreateController>();
  ChooseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Constants.primaryColor,
      title: 'Choose Category',
      titleColor: Constants.white,
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
              verticalMargin: 8.0,
              text: 'Next',
              onPressed: () {
                log('Next');
                Get.back();
              },
            ),
            WidgetsUtil.verticalSpace8,
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16,
      ),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: List.generate(Assets.quizCategories.length, (index) {
        CategoryItem item = Assets.quizCategories[index];
        return InkWell(
          onTap: () {
            controller.selectedCategory.value = item;
          },
          child: Obx(
            () => CategoryCard(
              categoryName: item.name,
              backgroundColor:
                  getCategoryEquality(item) ? Constants.pink : Constants.grey5,
              icon: item.asset,
              quizzes: 12,
              iconColor:
                  getCategoryEquality(item) ? null : Constants.primaryColor,
              iconShadowOpacity: getCategoryEquality(item) ? null : 1,
              textColor:
                  getCategoryEquality(item) ? null : Constants.primaryColor,
            ),
          ),
        );
      }),
    );
  }

  bool getCategoryEquality(CategoryItem item) {
    return item == controller.selectedCategory.value;
  }
}
