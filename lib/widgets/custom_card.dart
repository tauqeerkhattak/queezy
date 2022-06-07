import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsets? padding;

  const CustomCard({
    Key? key,
    this.height,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Constants.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
