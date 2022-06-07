import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String? suffixIcon, label, prefixIcon;
  final Function()? onSuffixTap;
  final Function()? onTap;
  final Color? fillColor;
  final Color? iconTextColor;
  final Color? borderColor;
  final bool showBorder;
  final FocusNode? node;
  final int? maxLines;
  final double? textSize;
  final FontWeight? titleWeight;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomTextField({
    Key? key,
    this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.fillColor = Colors.white,
    this.iconTextColor,
    this.showBorder = false,
    this.onTap,
    this.node,
    this.textSize,
    this.titleWeight,
    this.borderColor,
    this.maxLines,
    this.mainAxisAlignment,
  }) : super(key: key);

  bool isDark(Color color) {
    return color.computeLuminance() < 0.5;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkness = isDark(fillColor!);
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        if (label != null)
          Container(
            margin: const EdgeInsets.only(
              left: 24,
            ),
            alignment: Alignment.centerLeft,
            child: TitleText(
              text: label!,
              weight: titleWeight ?? FontWeight.w400,
              textColor: Constants.black2,
              size: textSize ?? Constants.bodySmall,
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
            maxLines: maxLines ?? 1,
            focusNode: node,
            onTap: onTap,
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
              prefixIcon: prefixIcon != null
                  ? Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: prefixIcon!.contains('.svg')
                          ? SvgPicture.asset(
                              prefixIcon!,
                              // fit: BoxFit.contain,
                              color: isDarkness ? Constants.white : null,
                            )
                          : Image.asset(
                              prefixIcon!,
                              // fit: BoxFit.contain,
                              color: isDarkness ? Constants.white : null,
                            ),
                    )
                  : null,
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
                        child: suffixIcon!.contains('.svg')
                            ? SvgPicture.asset(
                                suffixIcon!,
                                fit: BoxFit.contain,
                                color: isDarkness ? Constants.white : null,
                              )
                            : Image.asset(
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
                fontSize: Constants.bodyNormal,
                color: isDarkness ? Constants.white : Constants.grey2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: showBorder
            ? BorderSide(
                color: borderColor ?? Constants.primaryColor,
                width: 2,
              )
            : BorderSide.none,
      );
}
