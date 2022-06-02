
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/style_properties.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/title_text.dart';

class CategoryCard extends StatelessWidget {
  final int quizzes;
  final String categoryName;
  final String icon;
  final Color color;
  const CategoryCard({Key? key,
    required this.categoryName,
    required this.color,
    required this.icon,
    required this.quizzes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: StyleProperties.cardsRadius,
        color: color,
      ),
      padding: StyleProperties.insets18,
      child: Column(
        children: [
          _iconBox(),
          WidgetsUtil.verticalSpace10,
          TitleText(
              text: categoryName,
            textColor: Constants.white,
            size: Constants.largeText,
            weight: FontWeight.w500,
          ),
          WidgetsUtil.verticalSpace8,
          TitleText(
              text: "$quizzes Quizzes",
              textColor: Constants.white,
              size: Constants.smallText,
              weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
  
  Widget _iconBox() => Container(
    decoration: BoxDecoration(
      color: Constants.white.withOpacity(0.2),
      borderRadius: StyleProperties.cardsRadius
    ),
    padding: StyleProperties.insets10,
    child: SvgPicture.asset(icon, height: 38, color: Constants.white),
  );
}
