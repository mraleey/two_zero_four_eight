import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/res/constants/fonts.dart';

import '../../controller/merge_controller.dart';
import '../../res/components/alert_dialogue.dart';
import '../../res/components/app_colors.dart';

class MergeView extends StatelessWidget {
  final MergeController controller = Get.put(MergeController());

  MergeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialogue(
                  restart: () {
                    controller.resetGame();
                    Get.back();
                  },
                );
              },
            );
          },
          icon: const Icon(Icons.pause_circle_filled),
          color: kWhiteColor,
          iconSize: 30,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              controller.swipeRight();
            } else if (details.primaryVelocity! < 0) {
              controller.swipeLeft();
            }
          },
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              controller.swipeDown();
            } else if (details.primaryVelocity! < 0) {
              controller.swipeUp();
            }
          },
          child: Column(
            children: [
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildScoreBox("Score", controller.score.value),
                    _buildScoreBox("Best", controller.highestScore.value),
                  ],
                );
              }),
              const Spacer(),
              Center(
                child: Obx(() {
                  return SizedBox(
                    width: Get.width * 0.9,
                    height: Get.width,
                    child: Stack(
                      children: [
                        for (int i = 0; i < 4; i++)
                          for (int j = 0; j < 4; j++)
                            _buildAnimatedTile(i, j, controller.grid[i][j]),
                      ],
                    ),
                  );
                }),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBox(String title, int score) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width * 0.3,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 18,
            ),
          ),
          Text(
            "$score",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorForValue(int value) {
    switch (value) {
      case 2:
        return Colors.yellow[200]!;
      case 4:
        return Colors.orange[200]!;
      case 8:
        return Colors.orange[400]!;
      case 16:
        return Colors.orange[600]!;
      case 32:
        return Colors.red[300]!;
      case 64:
        return Colors.red[400]!;
      case 128:
        return Colors.green[300]!;
      case 256:
        return Colors.green[500]!;
      case 512:
        return Colors.blue[300]!;
      case 1024:
        return Colors.blue[500]!;
      case 2048:
        return Colors.purple[300]!;
      default:
        return kDarkColor;
    }
  }

  Widget _buildAnimatedTile(int i, int j, int value) {
    return Obx(() {
      final position = controller.positions[i][j];
      final tileSize = Get.width * 0.2;
      const spacing = 8.0;

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 200),
        top: position.x * (tileSize + spacing),
        left: position.y * (tileSize + spacing),
        child: Container(
          width: tileSize,
          height: tileSize,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _getColorForValue(value),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            value > 0 ? "$value" : "",
            style: TextStyle(
              fontSize: CustomFontSize.extraExtraLarge(Get.context!) * 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    });
  }
}
