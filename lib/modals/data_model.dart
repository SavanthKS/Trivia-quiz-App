import 'dart:convert';

DataModel welcomeFromJson(String str) => DataModel.fromJson(json.decode(str));

class DataModel {
  DataModel({required this.questions});

  final List<Question> questions;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      questions:
          List<Question>.from(json["results"].map((x) => Question.fromJson(x))),
    );
  }
}

class Question {
  Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers:
            List<String>.from(json["incorrect_answers"].map((x) => x)),
      );
}
