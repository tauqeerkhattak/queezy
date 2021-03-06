import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? horizontalMargin;
  final double? verticalMargin;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;

  const CustomButton({
    Key? key,
    required this.text,
    this.horizontalMargin,
    this.verticalMargin,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: horizontalMargin ?? 16,
        right: horizontalMargin ?? 16,
        top: verticalMargin ?? 24,
      ),
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            const Size(
              311,
              52,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Constants.primaryColor,
          ),
        ),
        child: TitleText(
          text: text,
          align: TextAlign.center,
          textColor: textColor ?? Constants.white,
          size: Constants.bodyNormal,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
