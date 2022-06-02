import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomTextField extends StatelessWidget {
  final String hint, prefixIcon;
  final String? suffixIcon, label;
  final Function()? onSuffixTap;
  final Color? fillColor;
  // final bool showBorder;
  const CustomTextField({
    Key? key,
    this.label,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.fillColor,
    // required this.showBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Container(
            margin: const EdgeInsets.only(
              left: 24,
            ),
            alignment: Alignment.centerLeft,
            child: TitleText(
              text: label!,
              weight: FontWeight.w400,
              textColor: Constants.black2,
              size: Constants.bodySmall,
            ),
          ),
        Container(
          margin: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 8,
          ),
          padding: const EdgeInsets.all(0.0),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? Constants.primaryTextColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Constants.grey5,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: true
                    ? BorderSide(
                        color: Constants.primaryColor,
                        width: 2,
                      )
                    : BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Constants.grey5,
                  width: 2,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                maxWidth: 72,
                maxHeight: 24,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Image.asset(
                  prefixIcon,
                  fit: BoxFit.contain,
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 72,
                maxHeight: 24,
              ),
              suffixIcon: suffixIcon != null
                  ? GestureDetector(
                      onTap: onSuffixTap,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: Image.asset(
                          suffixIcon!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : null,
              hintText: hint,
              hintStyle: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: Constants.bodyNormal,
                color: Constants.grey2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
