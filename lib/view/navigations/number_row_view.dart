import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_zero_four_eight/controller/number_row_controller.dart';

class NumberRowView extends StatelessWidget {
  final NumberRowController numberRowController =
      Get.put(NumberRowController());

  NumberRowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Obx(() => Text(
                      "Next Block: ${numberRowController.nextNumber}",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              Obx(
                () => Column(
                  children: List.generate(6, (i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (j) {
                        int number = numberRowController.grid[i][j];
                        return GestureDetector(
                          onTap: () {
                            numberRowController.placeNumberInColumn(j);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: Get.width * 0.15,
                            height: Get.height * 0.08,
                            decoration: BoxDecoration(
                              color: number > 0
                                  ? numberRowController
                                      .getColorForNumber(number)
                                  : Colors.grey.withOpacity(0.5),
                            ),
                            child: Center(
                              child: number > 0
                                  ? Text(
                                      number.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    // Pause or restart game
                  },
                  icon: const Icon(Icons.pause_circle_filled),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ),
              Obx(() {
                if (numberRowController.isGameOver()) {
                  return const Center(
                    child: Text(
                      "Game Over",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return const SizedBox
                    .shrink(); // Return nothing if not game over
              }),
            ],
          ),
        ),
      ),
    );
  }
}
