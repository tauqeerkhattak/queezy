import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class SocialButton extends StatelessWidget {
  final double? verticalMargin;
  final double? horizontalMargin;
  final Color textColor;
  final String icon, text;
  final Function() onTap;
  final bool showBorder;
  final Color? background;
  final Color? iconColor;
  final double? height;

  const SocialButton({
    Key? key,
    this.verticalMargin,
    this.horizontalMargin,
    required this.textColor,
    required this.icon,
    required this.onTap,
    required this.text,
    required this.showBorder,
    this.background,
    this.iconColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      margin: EdgeInsets.only(
        top: verticalMargin ?? 0,
        left: horizontalMargin ?? 24,
        right: horizontalMargin ?? 24,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        border: showBorder
            ? Border.all(
                color: Constants.grey4,
                width: 2,
              )
            : null,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 18,
                ),
                TitleText(
                  text: text,
                  size: Constants.regularText,
                  weight: FontWeight.w500,
                  textColor: textColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
