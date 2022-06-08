import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/create_controller.dart';
import 'package:queezy/screens/create/create_complete.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/custom_button.dart';
import 'package:queezy/widgets/custom_card.dart';
import 'package:queezy/widgets/default_layout.dart';
import 'package:queezy/widgets/question_types/checkbox_answer.dart';
import 'package:queezy/widgets/question_types/cover_image.dart';
import 'package:queezy/widgets/question_types/multiple_answer.dart';
import 'package:queezy/widgets/question_types/poll.dart';
import 'package:queezy/widgets/question_types/puzzle.dart';
import 'package:queezy/widgets/question_types/true_false.dart';
import 'package:queezy/widgets/question_types/type_answer.dart';
import 'package:queezy/widgets/question_types/voice_note.dart';
import 'package:queezy/widgets/title_text.dart';

class Question extends StatelessWidget {
  final controller = Get.find<CreateController>();
  Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Create Quiz',
      backgroundColor: Constants.primaryColor,
      titleColor: Constants.white,
      child: CustomCard(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 8,
          top: 24,
        ),
        child: Column(
          children: [
            Expanded(
              child: _body(),
            ),
            CustomButton(
              verticalMargin: 8,
              text: 'Add Question',
              onPressed: () {
                Get.to(
                  () => const CreateComplete(),
                );
              },
            ),
            WidgetsUtil.verticalSpace8,
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          WidgetsUtil.verticalSpace16,
          questionNumber(),
          CoverImage(),
          Row(
            children: [
              Container(
                height: 32,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                margin: const EdgeInsets.only(
                  left: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.grey5,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: Constants.primaryColor,
                    ),
                    WidgetsUtil.horizontalSpace8,
                    TitleText(
                      text: '10 sec',
                      size: Constants.bodyXSmall,
                      textColor: Constants.black1,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 32,
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Constants.grey5,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: Obx(
                  () => DropdownButton<String?>(
                    underline: const SizedBox.shrink(),
                    alignment: Alignment.center,
                    value: controller.selectedQuestionType.value,
                    iconSize: 20,
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: Constants.primaryColor,
                      size: 20,
                    ),
                    items: controller.questionTypes
                        .map(
                          (questionType) => DropdownMenuItem<String?>(
                            value: questionType,
                            child: Center(
                              child: TitleText(
                                text: questionType,
                                size: Constants.bodyXSmall,
                                weight: FontWeight.w500,
                                textColor: Constants.black1,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.selectedQuestionType.value = value;
                    },
                  ),
                ),
              ),
            ],
          ),
          WidgetsUtil.verticalSpace24,
          Obx(() => getQuestionType()),
        ],
      ),
    );
  }

  Widget getQuestionType() {
    switch (controller.selectedQuestionType.value) {
      case 'True or False':
        return const TrueFalse();
      case 'Checkbox':
        return CheckboxAnswer(
          checkValue: controller.checkBoxValue.value,
          onChanged: (value) {
            controller.checkBoxValue.value = value!;
          },
        );
      case 'Multiple Answer':
        return const MultipleAnswer();
      case 'Poll':
        return const Poll();
      case 'Puzzle':
        return const Puzzle();
      case 'Type Answer':
        return const TypeAnswer();
      case 'Voice Note':
        return const VoiceNote();
      default:
        return const SizedBox();
    }
  }

  Padding questionNumber() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) {
              return Container(
                margin: const EdgeInsets.only(
                  left: 14,
                  right: 14,
                ),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.selectedQuestion.value == index
                      ? Constants.black2
                      : Colors.transparent,
                ),
                child: Center(
                  child: TitleText(
                    text: '${index + 1}',
                    textColor: controller.selectedQuestion.value == index
                        ? Constants.white
                        : Constants.black1,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
