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
        return Center(
          child: Container(
            height: Get.height * 0.3,
            margin: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Material(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Constants.cardsRadius,
                ),
              ),
              child: Column(
                children: [
                  WidgetsUtil.verticalSpace24,
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
                        text: 'Correct Answer',
                        textColor: Constants.black1,
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
          ),
        );
      },
    );
  }
}
