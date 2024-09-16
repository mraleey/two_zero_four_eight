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
                    """Tic Tac Toe 2 Player: XO Game is a classic puzzle game, also known as XO or Noughts and Crosses. 
                    
If you are an adult, you will get your favorite old memories of Tic Tac Toe. 

It is the best digital version of the classic Tic Tac Toe game that anyone can play online or offline.

User can simply select their symbol (X/O) at the start of their game and they can play with their friends in their free""",
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
