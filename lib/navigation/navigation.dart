import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/navigation_controller.dart';
import 'package:queezy/screens/create/create.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';

class Navigation extends StatelessWidget {
  final controller = Get.put(NavigationController());
  Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Constants.royalBlue,
        onPressed: () {
          Get.to(() => Create());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        backgroundColor: Constants.white,
        height: kBottomNavigationBarHeight,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20.0,
        rightCornerRadius: 20.0,
        notchSmoothness: NotchSmoothness.softEdge,
        tabBuilder: (index, value) => Obx(
          () => Container(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              Assets.navigationBarIcons[index],
              color: controller.selectedIndex.value == index
                  ? Constants.black1
                  : Constants.grey3,
            ),
          ),
        ),
        activeIndex: controller.selectedIndex.value,
        onTap: (index) {
          controller.selectedIndex.value = index;
          log('Item at #$index');
        },
      ),
      body: Obx(
        () => controller.bodyWidgets[controller.selectedIndex.value],
      ),
    );
  }
}
