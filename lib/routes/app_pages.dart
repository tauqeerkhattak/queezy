import 'package:get/get.dart';

import '../screens/splash/splash.dart';
import 'app_routes.dart';

class AppPages extends GetPageRoute {
  static List<GetPage> list = [
    GetPage(
        name: AppRoutes.SPLASH,
        // binding: SplashBinding(),
        page: () =>  Splash()
    ),
  ];
}