import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/utils/assets.dart';

import '../utils/constants.dart';

class DefaultBackground extends StatelessWidget {
  final Widget child;
  final String? background;
  const DefaultBackground({
    Key? key,
    required this.child,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Constants.royalBlue,
            child: Image.asset(
              background ?? Assets.background,
              fit: BoxFit.fill,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
