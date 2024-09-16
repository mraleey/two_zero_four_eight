import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/components/size.dart';

import '../../view/pages/mode_view.dart';
import '../constants/fonts.dart';
import 'app_colors.dart';

class CustomAlertDialogue extends StatelessWidget {
  const CustomAlertDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kWhiteColor,
      title: Center(
        child: Text(
          "Game Paused",
          style: TextStyle(
            color: kDarkColor,
            fontSize: CustomFontSize.extraExtraLarge(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [kPrimaryGreen, kButtonSecondStart],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: MaterialButton(
              onPressed: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.play_circle_filled,
                      color: kWhiteColor,
                    ),
                    getHorizontalSpace(10),
                    Text(
                      "Resume",
                      style: TextStyle(
                          fontSize: CustomFontSize.extraExtraLarge(context),
                          color: kWhiteColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          getVerticalSpace(15),
          Container(
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [kPrimaryRed, kButtonSecondStart],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: MaterialButton(
              onPressed: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.refresh,
                      color: kWhiteColor,
                    ),
                    getHorizontalSpace(10),
                    Text(
                      "Reset",
                      style: TextStyle(
                          fontSize: CustomFontSize.extraExtraLarge(context),
                          color: kWhiteColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          getVerticalSpace(15),
          Container(
            width: Get.width * 0.5,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [kButtonFirstStart, kButtonSecondStart],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: MaterialButton(
              onPressed: () {
                Get.offAll(() => const ModeView());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home,
                      color: kWhiteColor,
                    ),
                    getHorizontalSpace(10),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: CustomFontSize.extraExtraLarge(context),
                          color: kWhiteColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
