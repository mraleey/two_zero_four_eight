import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/grid_controller.dart';
import '../../res/components/app_colors.dart';
import '../../res/components/size.dart';
import '../../res/constants/fonts.dart';
import '../pages/mode_view.dart';

class MultiPlayerView extends StatelessWidget {
  final GridController gridController = GridController();
  MultiPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              "Multi Player Mode",
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: CustomFontSize.iconsFont(context)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: kPrimaryColor,
                        child:
                            Image(image: AssetImage("assets/images/tick.png")),
                      ),
                      Text(
                        "Player 1",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: CustomFontSize.iconsFont(context) / 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
                getHorizontalSpace(20),
                const Text(
                  "VS",
                  style: TextStyle(color: kWhiteColor, fontSize: 20),
                ),
                getHorizontalSpace(20),
                Container(
                  width: 100,
                  color: kPrimaryColor,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: kPrimaryColor,
                        child:
                            Image(image: AssetImage("assets/images/cross.png")),
                      ),
                      Text(
                        "Player 2",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: CustomFontSize.iconsFont(context) / 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Add the image to the box at the given index
                    gridController.addImage(index);
                  },
                  child: Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue, // Replace with your `kPrimaryColor`
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: gridController.images[index] != null
                            ? Image.asset(gridController.images[index]!)
                            : Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors
                                      .grey, // Replace with your `kLightColor`
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
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
                        gridController.resetGame();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                              fontSize: CustomFontSize.extraExtraLarge(context),
                              color: kWhiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
                getHorizontalSpace(15),
                Expanded(
                  child: Container(
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
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
