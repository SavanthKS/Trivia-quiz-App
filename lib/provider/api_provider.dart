import 'package:flutter/cupertino.dart';
import 'package:trivia_app/modals/data_model.dart';
import '../services/api_services.dart';

class ApiProvider extends ChangeNotifier {
  final String _baseUrl = "https://opentdb.com/api.php?amount=10";

  DataModel? dataModel;
  bool dataLoading = false;
  late Question currentQuestion;
  late int questionIndex;
  late int score;
  String selectedAnswer = "";

  Future<bool> fetchData() async {
    dataLoading = true;
    notifyListeners();
    questionIndex = 0;
    score = 0;
    selectedAnswer = "";
    dataModel = await ApiServices.getData(_baseUrl);
    if (dataModel == null) {
      dataLoading = false;
      notifyListeners();
      return false;
    } else {
      dataLoading = false;
      currentQuestion = dataModel!.questions[0];
      notifyListeners();
      return true;
    }
  }

  void updateScore() {
    if (selectedAnswer == currentQuestion.correctAnswer) {
      score = score + 10;
    }
  }

  void incrementQuestion() {
    questionIndex = questionIndex + 1;
    currentQuestion = dataModel!.questions[questionIndex];
    selectedAnswer = "";
    notifyListeners();
  }

  void setSelectedAnswer(String answer) {
    selectedAnswer = answer;
    notifyListeners();
  }
}
