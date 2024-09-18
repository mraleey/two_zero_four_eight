import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberRowController extends GetxController {
  RxList<List<int>> grid = List.generate(6, (_) => List.filled(5, 0)).obs;
  RxInt currentNumber = 2.obs;
  RxInt nextNumber = 2.obs;
  RxInt selectedColumn =
      (-1).obs; // User's selected column (-1 means not selected)

  Timer? timer;
  RxBool isDropping =
      false.obs; // Flag to indicate if a number is currently dropping

  @override
  void onInit() {
    super.onInit();
    _generateNextNumber();
    _startDroppingNumber();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  int _generateRandomNumber() {
    return pow(2, Random().nextInt(4) + 1) as int; // 2, 4, 8, 16
  }

  void _generateNextNumber() {
    nextNumber.value = _generateRandomNumber();
  }

  bool isGameOver() {
    // Check if all blocks are filled
    for (var row in grid) {
      if (row.contains(0)) return false; // There's still space
    }

    // Check if no merges are possible
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 5; j++) {
        int currentVal = grid[i][j];
        if (_hasMatchingNeighbor(i, j, currentVal)) {
          return false; // Merge possible
        }
      }
    }

    return true; // No space and no merges
  }

  void _startDroppingNumber() async {
    if (isGameOver()) {
      Get.snackbar("Game Over", "No more moves available",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (isDropping.value) {
      return; // If a number is currently dropping, do nothing
    }

    isDropping.value = true; // Set the flag to indicate a number is dropping
    currentNumber.value = nextNumber.value;
    _generateNextNumber();

    selectedColumn.value = -1; // Reset user selection

    // Give the user some time to select the column (e.g., 3 seconds)
    await Future.delayed(const Duration(seconds: 3));

    // If the user hasn't selected a column, use a random column
    int column =
        selectedColumn.value != -1 ? selectedColumn.value : Random().nextInt(5);

    await _dropNumberInColumn(
        column); // Drop the number in the selected or random column
    isDropping.value = false; // Reset the flag after dropping is complete

    _startDroppingNumber(); // Start new number immediately if the game is not over
  }

  Future<void> _dropNumberInColumn(int column) async {
    for (int row = 0; row < 6; row++) {
      if (grid[row][column] == 0) {
        grid[row][column] = currentNumber.value;
        grid.refresh();

        await Future.delayed(const Duration(seconds: 1)); // Slow down the drop

        if (row == 5 || grid[row + 1][column] != 0) {
          _checkForMatches(row, column);
          break;
        }

        grid[row][column] = 0; // Reset to empty if not the last row
        grid.refresh();
      }
    }
  }

  void placeNumberInColumn(int column) {
    if (isDropping.value) {
      return; // If a number is currently dropping, do nothing
    }

    selectedColumn.value = column;
    _dropNumberInSelectedColumn(); // Drop the number immediately after user selects the column
  }

  Future<void> _dropNumberInSelectedColumn() async {
    if (isDropping.value) {
      return; // If a number is currently dropping, do nothing
    }

    int column =
        selectedColumn.value != -1 ? selectedColumn.value : Random().nextInt(5);

    for (int row = 0; row < 6; row++) {
      if (grid[row][column] == 0) {
        grid[row][column] = currentNumber.value;
        grid.refresh();

        await Future.delayed(const Duration(milliseconds: 100));

        // If the block hits the bottom or another block, stop
        if (row == 5 || grid[row + 1][column] != 0) {
          _checkForMatches(row, column);
          break;
        }

        grid[row][column] = 0; // Reset to empty if not the last row
        grid.refresh();
      }
    }
  }

  void _checkForMatches(int row, int column) {
    int currentVal = grid[row][column];
    bool matchFound = false;

    // Check for all adjacent blocks and merge recursively
    while (_hasMatchingNeighbor(row, column, currentVal)) {
      if (column > 0 && grid[row][column - 1] == currentVal) {
        _mergeBlocks(row, column, row, column - 1);
        matchFound = true;
      }
      if (column < 4 && grid[row][column + 1] == currentVal) {
        _mergeBlocks(row, column, row, column + 1);
        matchFound = true;
      }
      if (row > 0 && grid[row - 1][column] == currentVal) {
        _mergeBlocks(row, column, row - 1, column);
        matchFound = true;
      }
      if (row < 5 && grid[row + 1][column] == currentVal) {
        _mergeBlocks(row, column, row + 1, column);
        matchFound = true;
      }
    }

    if (matchFound) {
      _playCelebrationAnimation(row, column);
      grid.refresh();
    }
  }

  // Check for matching neighbors in all directions
  bool _hasMatchingNeighbor(int row, int column, int value) {
    if (column > 0 && grid[row][column - 1] == value) return true;
    if (column < 4 && grid[row][column + 1] == value) return true;
    if (row > 0 && grid[row - 1][column] == value) return true;
    if (row < 5 && grid[row + 1][column] == value) return true;
    return false;
  }

  void _mergeBlocks(int row1, int col1, int row2, int col2) {
    grid[row1][col1] = 0;
    grid[row2][col2] *= 2;
    grid.refresh();
  }

  void _playCelebrationAnimation(int row, int column) {}

  Color getColorForNumber(int number) {
    switch (number) {
      case 2:
        return Colors.yellow;
      case 4:
        return Colors.orange;
      case 8:
        return Colors.red;
      case 16:
        return Colors.purple;
      case 32:
        return Colors.blue;
      case 64:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
