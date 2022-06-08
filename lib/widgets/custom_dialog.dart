import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomDialog {
  static bool value = false;
  static void showMultipleQuestionDialog() {
    showDialog(
      context: Get.context!,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          contentPadding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
          ),
          backgroundColor: Constants.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          scrollable: true,
          content: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                CustomTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  hint: 'Add answer',
                  label: 'Add answer',
                  textSize: Constants.bodyNormal,
                  titleWeight: FontWeight.w500,
                  iconTextColor: Constants.black1,
                  showBorder: true,
                  borderColor: Constants.grey5,
                  maxLines: 3,
                ),
                WidgetsUtil.verticalSpace16,
                Row(
                  children: [
                    WidgetsUtil.horizontalSpace24,
                    TitleText(
                      text: 'Correct answer',
                      textColor: Constants.black2,
                      weight: FontWeight.w500,
                      size: Constants.bodyNormal,
                    ),
                    const Spacer(),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Switch(
                          value: value,
                          activeColor: Constants.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              CustomDialog.value = value;
                            });
                          },
                        );
                      },
                    ),
                    WidgetsUtil.horizontalSpace24,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showCheckBoxDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          contentPadding: const EdgeInsets.all(24),
          backgroundColor: Constants.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          scrollable: true,
          content: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: 'Add answer',
                  textSize: Constants.bodyNormal,
                  titleWeight: FontWeight.w500,
                  hint: 'Add answer',
                  fillColor: Constants.white,
                  horizontalMargin: 0,
                  showBorder: true,
                  borderColor: Constants.grey5,
                  prefixIcon: StatefulBuilder(
                    builder: (BuildContext context, setState) => Checkbox(
                      value: CustomDialog.value,
                      onChanged: (value) {
                        setState(
                          () => CustomDialog.value = value!,
                        );
                      },
                      fillColor: MaterialStateProperty.all(
                        Constants.primaryColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                WidgetsUtil.verticalSpace8,
                Row(
                  children: [
                    TitleText(
                      text: 'Correct answer',
                      textColor: Constants.black2,
                      weight: FontWeight.w500,
                      size: Constants.bodyNormal,
                    ),
                    const Spacer(),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Switch(
                          value: value,
                          activeColor: Constants.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              CustomDialog.value = value;
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
