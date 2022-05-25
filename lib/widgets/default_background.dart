import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class DefaultBackground extends StatelessWidget {
  final Widget child;
  const DefaultBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.height,
          color: Constants.primaryColor,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
          ),
        ),
        child,
      ],
    );
  }
}
