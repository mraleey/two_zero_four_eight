import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/components/app_colors.dart';

import '../../res/components/alert_dialogue.dart';
import '../../res/components/size.dart';
import '../../res/constants/fonts.dart';

class NumberRowView extends StatelessWidget {
  const NumberRowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTransparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Next Block",
                  style: TextStyle(
                    fontSize: CustomFontSize.extraLarge(context),
                    color: kWhiteColor.withOpacity(0.5),
                  ),
                ),
              ),
              getVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(
                      Icons.arrow_downward_sharp,
                      color: kWhiteColor.withOpacity(0.7),
                      size: 30,
                    ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 6; i++)
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int j = 0; j < 5; j++)
                            Container(
                              width: Get.width * 0.15,
                              height: Get.height * 0.08,
                              decoration: BoxDecoration(
                                color: kDarkLight.withOpacity(0.5),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
              getVerticalSpace(20),
              Center(
                child: Text(
                  "Score",
                  style: TextStyle(
                    fontSize: CustomFontSize.extraLarge(context),
                    color: kWhiteColor.withOpacity(0.5),
                  ),
                ),
              ),
              getVerticalSpace(10),
              Center(
                child: Text(
                  "0",
                  style: TextStyle(
                    fontSize: CustomFontSize.extraLarge(context),
                    color: kWhiteColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialogue();
                      },
                    );
                  },
                  icon: const Icon(Icons.pause_circle_filled),
                  color: kWhiteColor,
                  iconSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
