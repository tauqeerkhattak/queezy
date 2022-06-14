import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class OptionContainer extends StatelessWidget {
  double? width;
  double? height;
  Color? color;
  Widget child;

  OptionContainer({
    required this.child,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height ?? Get.height * 0.08,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Constants.grey5,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: child,
    );
  }
}
