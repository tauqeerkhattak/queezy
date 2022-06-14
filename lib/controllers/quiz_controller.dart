import 'package:get/get.dart';

class QuizController extends GetxController {
  RxInt selectedIndex = (-1).obs;
  RxList checkboxIndex = [false, false, false, false].obs;

  List checkboxanswers = [
    "Mohamed Salah",
    "Marcus Rashford",
    "Sadio Mane",
    "Aubameyang",
  ];
  List answers = [
    "Robin van Persie",
    "Sadio Mane",
    "Harry Kane",
    "Christian Benteke",
  ];
}
