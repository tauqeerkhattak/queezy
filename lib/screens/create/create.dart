import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/screens/create/choose_category.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_appbar.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_text_field.dart';
import 'package:queezy/widgets/title_text.dart';

class Create extends StatelessWidget {
  final controller = Get.put(CreateController());
  Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.royalBlue,
      body: Column(
        children: [
          CustomAppBar(
            title: 'Create Quiz',
            onBackTapped: () => Get.back(),
          ),
          _body(),
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: Constants.white,
            borderRadius: BorderRadius.circular(
              Constants.cardsRadius,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    log('Pick Image!');
                    controller.pickImage(source: ImageSource.gallery);
                  },
                  child: Obx(
                    () => Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Constants.grey5,
                        borderRadius: BorderRadius.circular(
                          Constants.cardsRadius,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      width: Get.width,
                      height: 200,
                      child: controller.image.value != null
                          ? Image.file(
                              File(
                                controller.image.value!.path,
                              ),
                              fit: BoxFit.cover,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.selectedPicture,
                                ),
                                WidgetsUtil.verticalSpace8,
                                TitleText(
                                  text: 'Add Cover Image',
                                  size: Constants.regularText,
                                  weight: FontWeight.w500,
                                  textColor: Constants.royalBlue,
                                )
                              ],
                            ),
                    ),
                  ),
                ),
                WidgetsUtil.verticalSpace16,
                CustomTextField(
                  label: 'Title',
                  hint: 'Enter quiz title',
                  borderColor: Constants.grey5,
                  textSize: Constants.regularText,
                  titleWeight: FontWeight.w500,
                  showBorder: true,
                ),
                WidgetsUtil.verticalSpace16,
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TitleText(
                      text: 'Quiz Category',
                      weight: FontWeight.w500,
                      size: Constants.regularText,
                    ),
                  ),
                ),
                WidgetsUtil.verticalSpace8,
                InkWell(
                  onTap: () {
                    log('Choose Category');
                    Get.to(() => ChooseCategory());
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      border: Border.all(
                        color: Constants.grey5,
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        WidgetsUtil.horizontalSpace10,
                        TitleText(
                          text: 'Choose quiz category',
                          weight: FontWeight.w400,
                          textColor: Constants.grey2,
                          size: Constants.regularText,
                        ),
                        const Spacer(),
                        Icon(
                          CupertinoIcons.forward,
                          color: Constants.black1,
                        ),
                        WidgetsUtil.horizontalSpace10,
                      ],
                    ),
                  ),
                ),
                WidgetsUtil.verticalSpace16,
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TitleText(
                      text: 'Description',
                      weight: FontWeight.w500,
                      size: Constants.regularText,
                    ),
                  ),
                ),
                CustomTextField(
                  hint: 'Enter quiz description',
                  showBorder: true,
                  borderColor: Constants.grey5,
                  maxLines: 5,
                ),
                WidgetsUtil.verticalSpace24,
                CustomButton(
                  text: 'Add Question',
                  onPressed: () {},
                ),
                WidgetsUtil.verticalSpace24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
