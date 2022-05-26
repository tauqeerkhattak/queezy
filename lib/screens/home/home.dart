import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queezy/controllers/home_controller.dart';
import 'package:queezy/utils/assets.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/utils/widgets_util.dart';
import 'package:queezy/widgets/title_text.dart';

class Home extends StatelessWidget {
  final controller = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size(
          Get.width,
          70,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          margin: const EdgeInsets.only(
            top: 60,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      text: 'Good Morning',
                      textColor: Constants.accent1,
                      size: Constants.bodyXSmall,
                      weight: FontWeight.w500,
                    ),
                    TitleText(
                      text: 'Madelyn Dias',
                      textColor: Constants.primaryTextColor,
                      size: Constants.heading3,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundColor: Constants.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          WidgetsUtil.verticalSpace24,
          Container(
            height: 84,
            width: Get.width,
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.swivels,
                ),
              ),
              borderRadius: BorderRadius.circular(20),
              color: Constants.secondaryAccent,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetsUtil.verticalSpace16,
                        TitleText(
                          text: 'Recent Quiz'.toUpperCase(),
                          size: Constants.bodySmall,
                          weight: FontWeight.w500,
                          textColor: Constants.secondaryTextColor,
                        ),
                        WidgetsUtil.verticalSpace8,
                        Row(
                          children: [
                            Icon(
                              Icons.headphones,
                              color: Constants.secondaryTextColor,
                            ),
                            WidgetsUtil.verticalSpace8,
                            TitleText(
                              text: 'A Basic Music Quiz',
                              size: Constants.bodyLarge,
                              weight: FontWeight.w500,
                              textColor: Constants.secondaryTextColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
