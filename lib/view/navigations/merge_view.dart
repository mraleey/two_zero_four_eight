import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/components/alert_dialogue.dart';
import 'package:two_zero_four_eight/res/components/app_colors.dart';
import 'package:two_zero_four_eight/res/components/size.dart';
import 'package:two_zero_four_eight/res/constants/fonts.dart';

class MergeView extends StatelessWidget {
  const MergeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTransparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kTransparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomAlertDialogue();
                    },
                  );
                },
                icon: const Icon(Icons.pause_circle_filled),
                color: kWhiteColor,
                iconSize: 30,
              ),
              getVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: kDarkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: Get.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              "Score",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kWhiteColor.withOpacity(0.5),
                                  fontSize: CustomFontSize.extraLarge(context)),
                            ),
                            Text(
                              "0",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: CustomFontSize.extraLarge(context)),
                            ),
                          ],
                        ),
                      )),
                  Container(
                      decoration: BoxDecoration(
                        color: kDarkColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: Get.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              "Best",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kWhiteColor.withOpacity(0.5),
                                  fontSize: CustomFontSize.extraLarge(context)),
                            ),
                            Text(
                              "0",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: CustomFontSize.extraLarge(context)),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              getVerticalSpace(25),
              Center(
                child: Text(
                  "Join the numbers and get to the 2048 tile!",
                  style: TextStyle(
                    color: kWhiteColor.withOpacity(0.5),
                    fontSize: CustomFontSize.large(context),
                  ),
                ),
              ),
              getVerticalSpace(35),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int j = 0; j < 4; j++)
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: Get.width * 0.2,
                                height: Get.height * 0.1,
                                decoration: BoxDecoration(
                                  color: kDarkLight.withOpacity(0.5),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
