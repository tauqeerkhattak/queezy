import 'package:flutter/material.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Function() onBackTapped;
  final String? backIcon;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onBackTapped,
    this.backIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TitleText(
        text: title,
        weight: FontWeight.w500,
        size: Constants.heading3,
        textColor: Constants.primaryTextColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      leading: InkWell(
        onTap: onBackTapped,
        child: Container(
          padding: const EdgeInsets.all(
            15,
          ),
          child: Image.asset(
            backIcon ?? Assets.backIcon,
            color: Constants.primaryTextColor,
          ),
        ),
      ),
    );
  }
}
