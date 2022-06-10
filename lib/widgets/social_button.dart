import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class SocialButton extends StatelessWidget {
  final double? verticalMargin;
  final double? horizontalMargin;
  final Color textColor;
  final String text;
  final String? icon;
  final Function() onTap;
  final bool showBorder;
  final Color? background;
  final Color? iconColor;
  final double? height;
  final double? itemSpace;
  // final double? width;

  const SocialButton({
    Key? key,
    this.verticalMargin,
    this.horizontalMargin,
    required this.textColor,
    required this.onTap,
    required this.text,
    required this.showBorder,
    this.background,
    this.icon,
    this.iconColor,
    this.height,
    this.itemSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      width: double.maxFinite,
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
                _icon(),
                if (icon != null)
                  SizedBox(
                    width: itemSpace ?? 18,
                  ),
                TitleText(
                  text: text,
                  size: Constants.bodyNormal,
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

  Widget _icon() {
    if (icon != null) {
      if (icon!.contains('.svg')) {
        return SvgPicture.asset(
          icon!,
          width: 20,
          height: 20,
          color: iconColor,
        );
      } else {
        return Image.asset(
          icon!,
          width: 20,
          height: 20,
          color: iconColor,
        );
      }
    } else {
      return const SizedBox();
    }
  }
}
