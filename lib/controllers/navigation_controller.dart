import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/screens/discover/discover.dart';
import 'package:queezy/screens/home/home_screen.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> bodyWidgets = [
    HomeScreen(),
    Discover(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.black,
    ),
  ];
}
