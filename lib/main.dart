import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:queezy/screens/splash/splash.dart';

void main() {
  runApp(const Queezy());
}

class Queezy extends StatelessWidget {
  const Queezy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const ScrollBehavior(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      ),
      home: Splash(),
    );
  }
}
