import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/components/button.dart';
import 'package:two_zero_four_eight/res/constants/fonts.dart';
import 'package:two_zero_four_eight/view/navigations/number_row_view.dart';
import 'package:two_zero_four_eight/view/pages/about_view.dart';

import '../../res/components/app_colors.dart';
import '../../res/components/size.dart';
import '../navigations/merge_view.dart';

class ModeView extends StatelessWidget {
  const ModeView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      backgroundColor: kTransparent,
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
                          color: kButtonSecondStart)),
                  Text("4",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kButtonSecondEnd)),
                  Text("8",
                      style: TextStyle(
                          fontSize: CustomFontSize.iconsFont(context) * 2,
                          color: kPrimaryRed)),
                ],
              ),
              getVerticalSpace(10),
              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBrownColor,
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryRed.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: Image.asset(
                        fit: BoxFit.fill,
                        "assets/images/merge.jpg",
                        height: Get.height * 0.2,
                        width: Get.width,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "2048 Merge",
                          style: TextStyle(
                            fontSize: CustomFontSize.extraExtraLarge(context),
                            color: kWhiteColor,
                          ),
                        ),
                        CustomButton(
                          text: "Play",
                          press: () {
                            Get.to(() => MergeView());
                          },
                          widthValue: 100,
                          color: kBrownColor.withOpacity(0.1),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              getVerticalSpace(15),
              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPurpleColor,
                  boxShadow: [
                    BoxShadow(
                      color: kWhiteColor.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: Image.asset(
                        fit: BoxFit.fill,
                        "assets/images/number_drop.jpg",
                        height: Get.height * 0.2,
                        width: Get.width,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Number Drop",
                          style: TextStyle(
                            fontSize: CustomFontSize.extraExtraLarge(context),
                            color: kWhiteColor,
                          ),
                        ),
                        CustomButton(
                          text: "Play",
                          press: () {
                            Get.to(() =>  NumberRowView());
                          },
                          widthValue: 100,
                          color: kPurpleColor.withOpacity(0.1),
                        )
                      ],
                    ),
                  ],
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
