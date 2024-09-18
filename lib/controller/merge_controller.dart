import 'dart:math';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MergeController extends GetxController {
  var grid = List.generate(4, (i) => List.generate(4, (j) => 0)).obs;
  var score = 0.obs;
  var highestScore = 0.obs;

  var positions =
      List.generate(4, (i) => List.generate(4, (j) => Point(i, j))).obs;

  @override
  void onInit() {
    super.onInit();
    _loadHighestScore();
    _addRandomBlock();
  }

  void swipeLeft() {
    bool moved = false;
    for (int i = 0; i < 4; i++) {
      List<int> originalRow = List.from(grid[i]);
      grid[i] = _shiftAndMergeRow(grid[i], i, true);
      if (originalRow != grid[i]) moved = true;
    }
    if (moved) {
      _addRandomBlock();
      _vibrate();
    }
  }

  void swipeRight() {
    bool moved = false;
    for (int i = 0; i < 4; i++) {
      List<int> originalRow = List.from(grid[i]);
      grid[i] = _shiftAndMergeRow(grid[i].reversed.toList(), i, true)
          .reversed
          .toList();
      if (originalRow != grid[i]) moved = true;
    }
    if (moved) {
      _addRandomBlock();
      _vibrate();
    }
  }

  void swipeUp() {
    bool moved = false;
    for (int j = 0; j < 4; j++) {
      List<int> col = [grid[0][j], grid[1][j], grid[2][j], grid[3][j]];
      List<int> newCol = _shiftAndMergeRow(col, j, false);
      for (int i = 0; i < 4; i++) {
        if (grid[i][j] != newCol[i]) {
          moved = true;
        }
        grid[i][j] = newCol[i];
      }
    }
    if (moved) {
      _addRandomBlock();
      _vibrate();
      grid.refresh();
    }
  }

  void swipeDown() {
    bool moved = false;
    for (int j = 0; j < 4; j++) {
      List<int> col = [grid[0][j], grid[1][j], grid[2][j], grid[3][j]];
      List<int> newCol =
          _shiftAndMergeRow(col.reversed.toList(), j, false).reversed.toList();
      for (int i = 0; i < 4; i++) {
        if (grid[i][j] != newCol[i]) {
          moved = true;
        }
        grid[i][j] = newCol[i];
      }
    }
    if (moved) {
      _addRandomBlock();
      _vibrate();
      grid.refresh();
    }
  }

  List<int> _shiftAndMergeRow(List<int> row, int index, bool isRow) {
    List<int> newRow = row.where((int num) => num != 0).toList();
    for (int i = 0; i < newRow.length - 1; i++) {
      if (newRow[i] == newRow[i + 1]) {
        newRow[i] *= 2;
        score.value += newRow[i];
        newRow[i + 1] = 0;
      }
    }
    newRow = newRow.where((int num) {
      return num != 0;
    }).toList();
    while (newRow.length < 4) {
      newRow.add(0);
    }

    for (int i = 0; i < 4; i++) {
      if (isRow) {
        positions[index][i] = Point(index, i);
      } else {
        positions[i][index] = Point(i, index);
      }
    }

    return newRow;
  }

  void _addRandomBlock() {
    if (_isGameOver()) {
      _showGameOverDialog();
      return;
    }

    List<Point<int>> emptySpaces = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (grid[i][j] == 0) {
          emptySpaces.add(Point(i, j));
        }
      }
    }
    if (emptySpaces.isNotEmpty) {
      var randomSpace = emptySpaces[Random().nextInt(emptySpaces.length)];
      grid[randomSpace.x][randomSpace.y] = Random().nextBool() ? 2 : 4;
    }
  }

  bool _isGameOver() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (grid[i][j] == 0) return false;
      }
    }

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == grid[i][j + 1] || grid[j][i] == grid[j + 1][i]) {
          return false;
        }
      }
    }

    return true;
  }

  void _showGameOverDialog() {
    Get.defaultDialog(
      title: "Game Over",
      middleText: "You have no more moves!",
      onConfirm: () {
        _updateHighestScore();
        grid.value = List.generate(4, (i) => List.generate(4, (j) => 0));
        score.value = 0;
        _addRandomBlock();
        Get.back();
      },
      textConfirm: "Restart",
      barrierDismissible: false,
    );
  }

  void _vibrate() {
    Vibration.vibrate(duration: 50);
  }

  void resetGame() {
    grid.value = List.generate(4, (i) => List.generate(4, (j) => 0));
    score.value = 0;
    _addRandomBlock();
  }

  void _updateHighestScore() async {
    final prefs = await SharedPreferences.getInstance();
    int storedHighScore = prefs.getInt('highest_score') ?? 0;
    if (score.value > storedHighScore) {
      await prefs.setInt('highest_score', score.value);
      highestScore.value = score.value;
    }
  }

  void _loadHighestScore() async {
    final prefs = await SharedPreferences.getInstance();
    int storedHighScore = prefs.getInt('highest_score') ?? 0;
    highestScore.value = storedHighScore;
  }
}
