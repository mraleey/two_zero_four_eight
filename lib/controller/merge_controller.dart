import 'package:get/get.dart';

class MergeController extends GetxController{
  var score = 0.obs;
  var highScore = 0.obs;

  void updateScore(int value){
    score.value += value;
    if(score.value > highScore.value){
      highScore.value = score.value;
    }
  }

  void resetScore(){
    score.value = 0;
  }
}