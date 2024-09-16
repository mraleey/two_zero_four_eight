import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/components/app_colors.dart';
import 'package:two_zero_four_eight/res/constants/fonts.dart';
import 'package:vibration/vibration.dart';

import '../view/pages/mode_view.dart';

class GridController extends GetxController {
  // This list will hold the image paths for each grid box.
  var images = List<String?>.filled(9, null).obs;

  // Keep track of the last added image (to alternate between tick and cross)
  var lastImageTick = true.obs;

  // Method to set an image in a specific box
  Future<void> addImage(int index) async {
    // Don't allow overwriting an already filled box
    if (images[index] != null) return;

    // Alternate between tick and cross images
    if (lastImageTick.value) {
      images[index] = 'assets/images/tick.png'; // Set tick image
    } else {
      images[index] = 'assets/images/cross.png'; // Set cross image
    }

    // Toggle the flag to alternate for the next click
    lastImageTick.value = !lastImageTick.value;

    // Trigger vibration on insertion
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 100); // Vibrate for 100ms
    }

    // After every move, check for a winner or a draw
    checkWinner();
  }

  // Method to check if any player has won the game
  void checkWinner() {
    // Check rows for a win
    for (int i = 0; i < 9; i += 3) {
      if (images[i] != null &&
          images[i] == images[i + 1] &&
          images[i + 1] == images[i + 2]) {
        announceWinner(images[i]!);
        return;
      }
    }

    // Check columns for a win
    for (int i = 0; i < 3; i++) {
      if (images[i] != null &&
          images[i] == images[i + 3] &&
          images[i + 3] == images[i + 6]) {
        announceWinner(images[i]!);
        return;
      }
    }

    // Check diagonals for a win
    if (images[0] != null && images[0] == images[4] && images[4] == images[8]) {
      announceWinner(images[0]!);
      return;
    }

    if (images[2] != null && images[2] == images[4] && images[4] == images[6]) {
      announceWinner(images[2]!);
      return;
    }

    // If no winner, check if all boxes are filled for a draw
    if (!images.contains(null)) {
      announceWinner('draw');
    }
  }

  // Method to announce the winner or a draw
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

    // Show a dialog announcing the result (winner or draw)
    showDialog(
      context: Get.context!,
      barrierDismissible:
          false, // Prevent closing the dialog by tapping outside
      builder: (_) => AlertDialog(
        backgroundColor: kPrimaryColor, // Custom background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        title: Row(
          children: [
            const Icon(Icons.emoji_events, color: kPrimaryRed), // Add an icon
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: kPrimaryRed, // Title color
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: TextStyle(
            color: kWhiteColor, // Message color
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
                backgroundColor: kPrimaryGreen, // Custom button background
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Rounded button corners
                ),
              ),
              child: const Text(
                "Play Again",
                style: TextStyle(
                  color: kWhiteColor, // Button text color
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
                backgroundColor: kPrimaryRed, // Custom button background
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Rounded button corners
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: kWhiteColor, // Button text color
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

  // Method to reset the game board
  void resetGame() {
    images.value = List<String?>.filled(9, null);
    lastImageTick.value = true; // Reset to Player 1 (Tick)
  }
}
