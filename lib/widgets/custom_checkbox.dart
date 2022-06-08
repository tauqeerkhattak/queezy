import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  final double? horizontalMargin;
  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.horizontalMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      margin: EdgeInsets.only(
        left: horizontalMargin ?? 24,
        right: horizontalMargin ?? 24,
      ),
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Constants.cardsRadius,
        ),
        border: Border.all(
          color: Constants.grey5,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Constants.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: TitleText(
              text: 'Add Answer',
              size: Constants.bodyNormal,
              weight: FontWeight.w400,
              textColor: Constants.grey2,
            ),
          ),
        ],
      ),
    );
  }
}
