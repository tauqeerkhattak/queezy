import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queezy/model/category_item.dart';

class CreateController extends GetxController {
  Rxn<XFile> image = Rxn<XFile>();
  final ImagePicker _picker = ImagePicker();
  Rxn<CategoryItem> selectedCategory = Rxn<CategoryItem>();
  Rxn<Widget> questionWidget = Rxn<Widget>();
  RxInt selectedQuestion = 0.obs;
  List<Widget> questions = [];
  RxnString selectedQuestionType = RxnString();
  RxBool checkBoxValue = RxBool(false);
  List<String> questionTypes = [
    'True or False',
    'Checkbox',
    'Multiple Answer',
    'Poll',
    'Puzzle',
    'Type Answer',
    'Voice Note',
  ];
  @override
  void onInit() {
    selectedQuestionType.value = questionTypes[0];
    super.onInit();
  }

  void pickImage({required ImageSource source}) async {
    XFile? temp = await _picker.pickImage(source: source);
    if (temp != null) {
      image.value = temp;
    }
  }
}
