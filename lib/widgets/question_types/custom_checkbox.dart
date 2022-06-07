import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_text_field.dart';

class CustomCheckbox extends StatelessWidget {
  final bool checkValue;
  final Function(bool?) onChanged;
  const CustomCheckbox({
    Key? key,
    required this.checkValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Add Question',
          textSize: Constants.bodyNormal,
          iconTextColor: Constants.black1,
          titleWeight: FontWeight.w500,
          showBorder: true,
          borderColor: Constants.grey5,
          hint: 'Enter your question',
        ),
        WidgetsUtil.verticalSpace16,
        check(),
        WidgetsUtil.verticalSpace16,
        check(),
      ],
    );
  }

  Widget check() {
    return Container(
      height: kBottomNavigationBarHeight,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
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
              value: checkValue,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              activeColor: Constants.primaryColor,
            ),
          ),
          Expanded(
            flex: 8,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Add Answer',
                border: _border(),
                focusedBorder: _border(),
                hintStyle: GoogleFonts.rubik(
                  fontSize: Constants.bodyNormal,
                  color: Constants.grey2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder _border() => const UnderlineInputBorder(
        borderSide: BorderSide.none,
      );
}
