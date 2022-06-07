import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';

class NotchedCard extends StatelessWidget {
  final Widget child;
  const NotchedCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Constants.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          child,
          Positioned(
            top: -6,
            left: 0,
            right: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
