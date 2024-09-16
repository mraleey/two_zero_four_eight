import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/constants/fonts.dart';
import 'package:two_zero_four_eight/view/navigations/multi_player.dart';
import 'package:two_zero_four_eight/view/navigations/offline_play.dart';
import 'package:two_zero_four_eight/view/pages/about_view.dart';

import '../../res/components/app_colors.dart';
import '../../res/components/size.dart';

class ModeView extends StatelessWidget {
  const ModeView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("2",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryYellow)),
                  Text("0",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryRed)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("4",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryRed)),
                  Text("8",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryYellow)),
                ],
              ),
              getVerticalSpace(10),
              Container(
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kButtonFirstStart, kButtonFirstEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Get.to(() => SinglePlayerView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Play Offline",
                      style: TextStyle(
                          fontSize: CustomFontSize.extraExtraLarge(context),
                          color: kWhiteColor),
                    ),
                  ),
                ),
              ),
              getVerticalSpace(15),
              Container(
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kButtonSecondStart, kButtonSecondEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Get.to(() => MultiPlayerView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Multi Player",
                      style: TextStyle(
                          fontSize: CustomFontSize.extraExtraLarge(context),
                          color: kWhiteColor),
                    ),
                  ),
                ),
              ),
              getVerticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: Get.width * 0.35,
                    color: kWhiteColor,
                  ),
                  Text(
                    "   OR    ",
                    style: TextStyle(
                      fontSize: CustomFontSize.large(context),
                      color: kLightColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: Get.width * 0.35,
                    color: kWhiteColor,
                  ),
                ],
              ),
              getVerticalSpace(15),
              Container(
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kButtonThirdStart, kButtonThirdEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8.0),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text(
                          textAlign: TextAlign.center,
                          "Not Available Yet",
                          softWrap: true,
                          style: TextStyle(
                            color: kPrimaryGreen,
                            fontSize: CustomFontSize.large(context),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Play Online",
                    style: TextStyle(
                      fontSize: CustomFontSize.extraExtraLarge(context),
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
              getVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Need Help? ",
                      style: TextStyle(color: kWhiteColor)),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const AboutUsView());
                    },
                    child: const Text(
                      "About Us",
                      style: TextStyle(color: kPrimaryYellow),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
