import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';

import 'title_text.dart';

class DefaultLayout extends StatelessWidget {
  final String title;
  final Widget child;
  const DefaultLayout({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        title: TitleText(
          text: title,
          size: Constants.heading3,
          weight: FontWeight.w500,
          textColor: Constants.black2,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Container(
            padding: const EdgeInsets.all(
              15,
            ),
            child: Image.asset(
              Assets.backIcon,
            ),
          ),
        ),
      ),
      body: child,
    );
  }
}
