import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/view/pages/mode_view.dart';

import '../../../res/components/app_colors.dart';
import '../../../res/components/size.dart';
import '../../res/constants/fonts.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: getScreenHeight(315),
                      width: getScreenWidth(335),
                      fit: BoxFit.cover,
                    ),
                  ),
                  getVerticalSpace(20),
                  Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: getTextSize(19),
                      color: kWhiteColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  getVerticalSpace(15),
                  Text(
                    """2048 is an easy and fun puzzle game. Even if you don't love numbers you will love this game. It is played on a 4x4 grid using the arrows or W, A, S, D keys alternatively. Every time you press a key - all tiles slide. Tiles with the same value that bump into one-another are merged. Although there might be an optimal strategy to play, there is always some level of chance. If you beat the game and would like to master it, try to finish with a smaller score. That would mean that you finished with less moves.
You’re playing the original version of 2048, the popular and addictive puzzle game available to play completely free and loved by millions.
2048 was inspired by 1024 by Veewo Studio and is conceptually similar to Threes by Asher Vollmer.""",
                    style: TextStyle(
                      fontSize: getTextSize(15),
                      fontWeight: FontWeight.w400,
                      color: kWhiteColor,
                      letterSpacing: 0.17,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.7,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kButtonSecondStart, kButtonThirdStart],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: MaterialButton(
                onPressed: () {
                  Get.to(() => const ModeView());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Back to Home",
                    style: TextStyle(
                        fontSize: CustomFontSize.extraExtraLarge(context),
                        color: kWhiteColor),
                  ),
                ),
              ),
            ),
            getVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}
