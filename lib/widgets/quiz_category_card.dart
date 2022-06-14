import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queezy/screens/quiz/quiz.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class QuizCategoryCard extends StatelessWidget {
  final String asset, name, category;
  final int quizNumber;
  final double? horizontalMargin;
  const QuizCategoryCard({
    Key? key,
    required this.asset,
    required this.name,
    required this.category,
    required this.quizNumber,
    this.horizontalMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 12,
        left: horizontalMargin ?? 0,
        right: horizontalMargin ?? 0,
        bottom: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          width: 2,
          color: Constants.grey5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {
          log('Category tapped');
          Get.to(Quiz());
        },
        contentPadding: const EdgeInsets.all(8.0),
        leading: Image.asset(
          asset,
          height: 64,
          width: 64,
        ),
        title: TitleText(
          text: name,
          size: Constants.bodyNormal,
          weight: FontWeight.w500,
          textColor: Constants.black1,
        ),
        subtitle: TitleText(
          text: '$category ◆ $quizNumber',
          size: Constants.bodyXSmall,
          weight: FontWeight.w400,
        ),
        trailing: Icon(
          CupertinoIcons.forward,
          color: Constants.primaryColor,
          size: 24,
        ),
      ),
    );
  }
}
