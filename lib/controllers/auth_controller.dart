import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt selectedProcess = 0.obs;
  PageController pageController = PageController();
  List<String> onBoarding = [
    'Create gamified quizzes becomes simple',
    'Find quizzes to test out your knowledge',
    'Take part in challenges with friends',
  ];
  List<String> signUpProcess = [
    'What’s your email?',
    'What’s your password?',
    'Create a username',
  ];
}
