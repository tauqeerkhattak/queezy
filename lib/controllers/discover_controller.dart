import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  RxBool sheetOpen = false.obs;
  RxInt selectedSearchTab = 0.obs;
  FocusNode focusNode = FocusNode();
  List<String> searchTabs = ['Top', 'Quiz', 'Categories', 'Friends'];

  @override
  void onInit() {
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        sheetOpen.value = false;
      }
    });
    super.onInit();
  }
}
