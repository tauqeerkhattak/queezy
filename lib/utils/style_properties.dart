import 'package:flutter/material.dart';

import 'constants.dart';

class StyleProperties {
  static final textBoxRadius = BorderRadius.circular(10);
  // static final radius15 = BorderRadius.circular(15);
  static final cardsRadius = BorderRadius.circular(20);
  // static final borderRadius15 = BorderRadius.circular(15);
  // static final borderRadius10 = BorderRadius.circular(10);
  // static final borderRadius30 = BorderRadius.circular(30);
  // static const borderRadiusHztRight60 = BorderRadius.horizontal(right: Radius.circular(ScreenValues.boxRadius));
  // static const borderRadiusHztLeft60 = BorderRadius.horizontal(left: Radius.circular(ScreenValues.boxRadius));
  // static final defaultBorder = Border.all(color: AppColors.primaryColor);
  // static final borderWithWidth2 = Border.all(width: 2, color: AppColors.primaryColor);
  // static final thickBorder = Border.all(width: 10, color: AppColors.slightlyGrey);

  //Margin or Padding

  // static const bottomInsets8 = EdgeInsets.only(bottom: 8);
  // static const insetsHzt16Top20Bottom10 = EdgeInsets.fromLTRB(16, 20, 16, 10);
  // static const insetsHzt16 = EdgeInsets.fromLTRB(16, 0, 16, 0);
  // static const bottomInsets12 = EdgeInsets.only(bottom: 12);
  // static const zero = EdgeInsets.all(0);
  // static const defaultInsets = EdgeInsets.all(8);
  // static const smallInsets5 = EdgeInsets.all(5);
  // static const smallInsets6 = EdgeInsets.all(6);
  static const insets10 = EdgeInsets.all(10);
  // static const insets12 = EdgeInsets.all(12);
  static EdgeInsets insets15 = EdgeInsets.all(15);
  static EdgeInsets insets18 = EdgeInsets.all(18);
  static EdgeInsets insets20 = EdgeInsets.all(20);
  // static const smallInsets5ExceptBottom = EdgeInsets.fromLTRB(5, 5, 5, 0);
  // static const bottomInsets10 = EdgeInsets.only(bottom: 10);
  static const rightInset15 = EdgeInsets.only(right: 15);
  // static const leftInset10 = EdgeInsets.only(left: 10);
  static const topInset6 = EdgeInsets.only(top: 6);
  static const topInset10 = EdgeInsets.only(top: 10);
  // static const topInset15 = EdgeInsets.only(top: 15);
  // static const topInsets20 = EdgeInsets.only(top: 20);
  // static const topInsets30 = EdgeInsets.only(top: 30);
  // static const topInsets40 = EdgeInsets.only(top: 40);
  static EdgeInsets insetsBottom80Hzt20 =
      EdgeInsets.only(left: 20, right: 20, bottom: 80);
  // static const insetsTop40Hzt20 = EdgeInsets.only(top: 40, left: 20, right: 20);
  // static const insetsVrt5Hzt20 = EdgeInsets.symmetric(vertical: 5, horizontal: 20);
  // static const insetsVrt5Hzt10 = EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  // static const insetsVrt8Hzt20 = EdgeInsets.symmetric(vertical: 8, horizontal: 20);
  // static const insetsVrt15Hzt20 = EdgeInsets.symmetric(vertical: 15, horizontal: 20);
  // static const insetsVrt8Hzt10 = EdgeInsets.symmetric(vertical: 8, horizontal: 10);
  // static const insetsVrt8Hzt30 = EdgeInsets.symmetric(vertical: 8, horizontal: 30);
  // static const insetsVrt8Hzt15 = EdgeInsets.symmetric(vertical: 8, horizontal: 15);
  // static const insetsVrt30Hzt35 = EdgeInsets.symmetric(horizontal: 35, vertical: 30);
  // static const insetsVrt30Hzt20 = EdgeInsets.symmetric(horizontal: 20, vertical: 30);
  // static const insetsVrt20Hzt20 = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  static const insetsVrt20Hzt20 =
      EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  // static const insetsHzt15 = EdgeInsets.symmetric(vertical: 0, horizontal: 15);
  static const insetsHzt20 = EdgeInsets.symmetric(vertical: 0, horizontal: 20);
  // static const insetsVrt5 = EdgeInsets.symmetric(vertical: 5, horizontal: 0);
  // static const insetsVrt8 = EdgeInsets.symmetric(vertical: 8, horizontal: 0);
  // static const insetsVrt10 = EdgeInsets.symmetric(vertical: 10, horizontal: 0);
  // static const insetsVrt15 = EdgeInsets.symmetric(vertical: 15, horizontal: 0);
  static const insetsVrt20 = EdgeInsets.symmetric(vertical: 20, horizontal: 0);
  // static const insetsVrt25 = EdgeInsets.symmetric(vertical: 25, horizontal: 0);

  static BoxDecoration blueBox =
      BoxDecoration(color: Constants.primaryColor, borderRadius: cardsRadius);

  static BoxDecoration pinkBox =
      BoxDecoration(color: Constants.pink, borderRadius: textBoxRadius);

  static BoxDecoration sheetBorder = BoxDecoration(
    color: Constants.white,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );

  // static BoxDecoration roundedRadiusDecoration({double? radius, Color? backgroundColor}) {
  //   return BoxDecoration(
  //       color: backgroundColor ?? AppColors.white,
  //       borderRadius: BorderRadius.circular((radius ?? ScreenValues.boxRadius)));
  // }
}
