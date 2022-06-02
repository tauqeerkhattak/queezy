import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queezy/utils/constants.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'By continuing, you agree to the ',
          style: GoogleFonts.rubik(
            fontSize: Constants.smallText,
            fontWeight: FontWeight.w400,
            color: Constants.grey3,
          ),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log('Terms of services');
                },
              text: 'Terms of Services',
              style: GoogleFonts.rubik(
                fontSize: Constants.smallText,
                fontWeight: FontWeight.w500,
                color: Constants.royalBlue,
              ),
            ),
            TextSpan(
              text: ' & ',
              style: GoogleFonts.rubik(
                fontSize: Constants.smallText,
                fontWeight: FontWeight.w400,
                color: Constants.grey3,
              ),
            ),
            TextSpan(
              text: 'Privacy Policy',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  log('Privacy Policy');
                },
              style: GoogleFonts.rubik(
                fontSize: Constants.smallText,
                fontWeight: FontWeight.w500,
                color: Constants.royalBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
