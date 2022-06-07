import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/title_text.dart';

class FriendCard extends StatelessWidget {
  final String name, icon;
  final int points;
  const FriendCard({
    Key? key,
    required this.name,
    required this.points,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetsUtil.horizontalSpace24,
        SvgPicture.asset(icon),
        WidgetsUtil.horizontalSpace16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TitleText(
              text: name,
              size: Constants.bodyNormal,
              weight: FontWeight.w500,
              textColor: Constants.black1,
            ),
            const SizedBox(
              height: 4,
            ),
            TitleText(
              text: '$points Points',
              size: Constants.bodySmall,
              weight: FontWeight.w400,
              textColor: Constants.grey2,
            ),
          ],
        ),
      ],
    );
  }
}
