import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:get/get.dart';
import 'package:queezy/controllers/discover_controller.dart';
import 'package:queezy/widgets/category_card.dart';
import 'package:queezy/widgets/friend_card.dart';
import 'package:queezy/widgets/info_card.dart';
import 'package:queezy/widgets/notched_card.dart';
import 'package:queezy/widgets/quiz_category_card.dart';

import '../../utils/assets.dart';
import '../../utils/constants.dart';
import '../../utils/style_properties.dart';
import '../../utils/widgets_util.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/title_text.dart';

class Discover extends StatelessWidget {
  final controller = Get.put(DiscoverController());
  Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.primaryColor,
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
            node: controller.focusNode,
            onTap: () {
              controller.sheetOpen.value = true;
            },
            hint: 'Quiz, categories, or friends',
            fillColor: Constants.black2.withOpacity(0.2),
            prefixIcon: Assets.search,
            showBorder: false,
          ),
          WidgetsUtil.verticalSpace24,
          Obx(
            () => controller.sheetOpen.value
                ? Expanded(
                    child: _searchSheet(),
                  )
                : Expanded(
                    child: CustomScrollView(
                      slivers: [
                        const SliverAppBar(
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
          ),
        ],
      ),
    );
  }

  Widget _sheet() {
    return Container(
      decoration: StyleProperties.sheetBorder,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetsUtil.verticalSpace24,
          _heading("Top rank of the week"),
          WidgetsUtil.verticalSpace16,
          _ranker(
            rankerCard: true,
            rankerName: "Brandon Matrovs",
            points: 124,
          ),
          WidgetsUtil.verticalSpace24,
          _heading("Categories"),
          WidgetsUtil.verticalSpace16,
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: kBottomNavigationBarHeight,
            ),
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: List.generate(
              Assets.quizCategories.length,
              (index) {
                return CategoryCard(
                  backgroundColor: Assets.quizCategories[index].color,
                  icon: Assets.quizCategories[index].asset,
                  categoryName: Assets.quizCategories[index].name,
                  quizzes: 21,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _heading(String text) => Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: TitleText(
          text: text,
          size: Constants.heading3,
          weight: FontWeight.w500,
        ),
      );

  Widget _ranker({rankerCard, rankerName, points}) {
    return Container(
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: StyleProperties.cardsRadius,
        image: DecorationImage(
          // image: Svg.Svg(Assets.rankerCardBg),
          image: svg_provider.Svg(
            Assets.rankerCardBg,
          ),
          fit: BoxFit.cover,
        ),
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
              size: Constants.bodyXSmall,
              textColor: Constants.white,
              weight: FontWeight.w500,
            ),
          ),
          SvgPicture.asset(
            Assets.man1,
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
                  size: Constants.bodyLarge,
                  // lineHeight: 2.0,
                  align: TextAlign.center,
                ),
                Padding(
                  padding: StyleProperties.topInset10,
                  child: TitleText(
                    text: "$points points",
                    textColor: Constants.white,
                    // weight: FontWeight.w500,
                    size: Constants.bodyNormal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _searchSheet() {
    return NotchedCard(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constants.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              Constants.cardsRadius,
            ),
            topLeft: Radius.circular(
              Constants.cardsRadius,
            ),
          ),
        ),
        child: Column(
          children: [
            WidgetsUtil.verticalSpace24,
            _tabs(),
            WidgetsUtil.verticalSpace24,
            _searchBottomItems(),
          ],
        ),
      ),
    );
  }

  Widget _searchBottomItems() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: kBottomNavigationBarHeight,
        ),
        child: Column(
          children: [
            Row(
              children: [
                WidgetsUtil.horizontalSpace24,
                TitleText(
                  text: 'Recent Searches',
                  size: Constants.bodyXLarge,
                  weight: FontWeight.w500,
                  textColor: Constants.black1,
                ),
                const Spacer(),
                TitleText(
                  text: 'Clear All',
                  textColor: Constants.primaryColor,
                  weight: FontWeight.w500,
                  size: Constants.bodySmall,
                ),
                WidgetsUtil.horizontalSpace24,
              ],
            ),
            ...List.generate(1, (index) {
              return QuizCategoryCard(
                asset: Assets.quizTypes[index],
                name: 'Statistics Math Quiz',
                category: 'Math',
                quizNumber: 12,
                horizontalMargin: 24,
              );
            }),
            WidgetsUtil.verticalSpace24,
            Container(
              margin: const EdgeInsets.only(
                left: 24,
              ),
              alignment: Alignment.centerLeft,
              child: TitleText(
                text: 'Friends',
                size: Constants.bodyXLarge,
                weight: FontWeight.w500,
                textColor: Constants.black1,
              ),
            ),
            WidgetsUtil.verticalSpace16,
            FriendCard(
              name: 'Maren Workman',
              points: 325,
              icon: Assets.woman2,
            ),
            WidgetsUtil.verticalSpace16,
            FriendCard(
              name: 'Brandon Matrovs',
              points: 124,
              icon: Assets.man3,
            ),
            WidgetsUtil.verticalSpace16,
            FriendCard(
              name: 'Manuela Lipshutz',
              points: 437,
              icon: Assets.woman1,
            ),
            WidgetsUtil.verticalSpace16,
          ],
        ),
      ),
    );
  }

  Obx _tabs() {
    return Obx(
      () => Row(
        children: List.generate(4, (index) {
          return Expanded(
            child: InkWell(
              onTap: () {
                controller.selectedSearchTab.value = index;
              },
              child: Column(
                children: [
                  Center(
                    child: TitleText(
                      text: controller.searchTabs[index],
                      weight: FontWeight.w500,
                      textColor: controller.selectedSearchTab.value == index
                          ? Constants.primaryColor
                          : Constants.grey2,
                    ),
                  ),
                  WidgetsUtil.verticalSpace8,
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: index == controller.selectedSearchTab.value
                          ? Constants.primaryColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
