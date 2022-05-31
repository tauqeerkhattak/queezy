import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomTextField extends StatelessWidget {
  final String hint, prefixIcon;
  final String? suffixIcon, label;
  final Function()? onSuffixTap;
  final Color? fillColor;
  final Color? iconTextColor;
  final bool showBorder;
  const CustomTextField({
    Key? key,
    this.label,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.fillColor,
    this.iconTextColor,
    this.showBorder = false,
  }) : super(key: key);

  bool isDark(Color color) {
    return color.computeLuminance() < 0.5;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkness = isDark(fillColor ?? Colors.transparent);
    return Column(
      children: [
        if (label != null)
          Container(
            margin: const EdgeInsets.only(left: 24,),
            alignment: Alignment.centerLeft,
            child: TitleText(
              text: label!,
              weight: FontWeight.w400,
              textColor: Constants.black2,
              size: Constants.smallText,
            ),
          ),
        Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 8,),
          padding: const EdgeInsets.all(0.0),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? Constants.white,
              border: _border(),
              focusedBorder: _border(),
              enabledBorder: _border(),
              prefixIconConstraints: const BoxConstraints(
                maxWidth: 72,
                maxHeight: 24,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: SvgPicture.asset(
                  prefixIcon,
                  // fit: BoxFit.contain,
                  color: isDarkness ? Constants.white : null,
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
                        child: SvgPicture.asset(
                          suffixIcon!,
                          fit: BoxFit.contain,
                          color: isDarkness ? Constants.white : null,
                        ),
                      ),
                    )
                  : null,
              hintText: hint,
              hintStyle: GoogleFonts.rubik(
                fontWeight: FontWeight.w400,
                fontSize: Constants.regularText,
                color: isDarkness ? Constants.white : Constants.grey2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border() =>  OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: showBorder ? BorderSide(
      color: Constants.royalBlue,
      width: 2,
    ) : BorderSide.none,
  );
}
