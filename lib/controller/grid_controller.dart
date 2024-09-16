import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/components/app_colors.dart';
import 'package:two_zero_four_eight/res/constants/fonts.dart';
import 'package:vibration/vibration.dart';

import '../view/pages/mode_view.dart';

class GridController extends GetxController {
  var images = List<String?>.filled(9, null).obs;

  var lastImageTick = true.obs;

  Future<void> addImage(int index) async {
    if (images[index] != null) return;

    if (lastImageTick.value) {
      images[index] = 'assets/images/tick.png';
    } else {
      images[index] = 'assets/images/cross.png';
    }

    lastImageTick.value = !lastImageTick.value;

    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 100);
    }

    checkWinner();
  }

  void checkWinner() {
    for (int i = 0; i < 9; i += 3) {
      if (images[i] != null &&
          images[i] == images[i + 1] &&
          images[i + 1] == images[i + 2]) {
        announceWinner(images[i]!);
        return;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (images[i] != null &&
          images[i] == images[i + 3] &&
          images[i + 3] == images[i + 6]) {
        announceWinner(images[i]!);
        return;
      }
    }

    if (images[0] != null && images[0] == images[4] && images[4] == images[8]) {
      announceWinner(images[0]!);
      return;
    }

    if (images[2] != null && images[2] == images[4] && images[4] == images[6]) {
      announceWinner(images[2]!);
      return;
    }

    if (!images.contains(null)) {
      announceWinner('draw');
    }
  }

  void announceWinner(String winnerImage) {
    String message;
    String title;

    if (winnerImage.contains('tick')) {
      title = "Congratulations!";
      message = "Player 1 (Tick) wins!";
    } else if (winnerImage.contains('cross')) {
      title = "Congratulations!";
      message = "Player 2 (Cross) wins!";
    } else {
      title = "Game Over!";
      message = "It's a draw!";
    }

    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            const Icon(Icons.emoji_events, color: kPrimaryRed),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: kPrimaryRed,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: TextStyle(
            color: kWhiteColor,
            fontSize: CustomFontSize.extraLarge(Get.context!),
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Get.back();
                resetGame();
              },
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: kPrimaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Play Again",
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Get.to(() => const ModeView());
              },
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: kPrimaryRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void resetGame() {
    images.value = List<String?>.filled(9, null);
    lastImageTick.value = true;
  }
}
