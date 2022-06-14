import 'package:get/get.dart';

class AnswerExplanationController extends GetxController {
  RxBool isPlaying = true.obs;

  playAudio() {
    isPlaying.value = !isPlaying.value;
  }
}
