class HistoryModel {
  String? categoryName;
  int? correctCount;
  List<QuizCollection>? quizCollection;
  int? quizCount;
  String? time;

  HistoryModel({
    this.categoryName,
    this.correctCount,
    this.quizCollection,
    this.quizCount,
    this.time,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    correctCount = json['correct_count'];
    if (json['quiz_collection'] != null) {
      quizCollection = <QuizCollection>[];
      json['quiz_collection'].forEach((v) {
        quizCollection!.add(QuizCollection.fromJson(v));
      });
    }
    quizCount = json['quiz_count'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['correct_count'] = correctCount;
    if (quizCollection != null) {
      data['quiz_collection'] = quizCollection!.map((v) => v.toJson()).toList();
    }
    data['quiz_count'] = quizCount;
    data['time'] = time;
    return data;
  }
}

class QuizCollection {
  String? answer;
  String? correctAnswer;
  String? question;
  String? time;

  QuizCollection({this.answer, this.correctAnswer, this.question, this.time});

  QuizCollection.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    correctAnswer = json['correct_answer'];
    question = json['question'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answer'] = answer;
    data['correct_answer'] = correctAnswer;
    data['question'] = question;
    data['time'] = time;
    return data;
  }
}
