import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomDivider extends StatelessWidget {
  final double? verticalMargin;
  final double? horizontalMargin;
  final String text;
  const CustomDivider({
    Key? key,
    this.verticalMargin,
    this.horizontalMargin,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: verticalMargin ?? 0,
        left: horizontalMargin ?? 24,
        right: horizontalMargin ?? 24,
      ),
      width: Get.width,
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                right: 17,
              ),
              child: Divider(
                thickness: 1,
                color: Constants.grey4,
              ),
            ),
          ),
          TitleText(
            text: text,
            size: Constants.regularText,
            textColor: Constants.grey2,
            weight: FontWeight.w400,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 17,
              ),
              child: Divider(
                thickness: 1,
                color: Constants.grey4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
