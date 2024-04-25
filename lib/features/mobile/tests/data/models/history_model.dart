class HistoryModel {
  int? collectionCount;
  List<QuizCollection>? quizCollection;
  int? quizCount;
  String? time;

  HistoryModel(
      {this.collectionCount, this.quizCollection, this.quizCount, this.time});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    collectionCount = json['collection_count'];
    if (json['quiz_collection'] != null) {
      quizCollection = <QuizCollection>[];
      json['quiz_collection'].forEach((v) {
        quizCollection!.add( QuizCollection.fromJson(v));
      });
    }
    quizCount = json['quiz_count'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['collection_count'] = this.collectionCount;
    if (this.quizCollection != null) {
      data['quiz_collection'] =
          this.quizCollection!.map((v) => v.toJson()).toList();
    }
    data['quiz_count'] = this.quizCount;
    data['time'] = this.time;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['correct_answer'] = this.correctAnswer;
    data['question'] = this.question;
    data['time'] = this.time;
    return data;
  }
}
