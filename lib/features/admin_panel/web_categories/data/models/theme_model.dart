class ThemeModel {
  String? createdTime;
  String? name;
  List<Quiz>? quiz;
  int? quizCount;
  int? duration;

  ThemeModel({this.createdTime, this.name, this.quiz, this.quizCount});

  ThemeModel.fromJson(Map<String, dynamic> json) {
    createdTime = json['created_time'];
    name = json['name'];
    if (json['quiz'] != null) {
      quiz = <Quiz>[];
      json['quiz'].forEach((v) {
        quiz!.add(Quiz.fromJson(v));
      });
    }
    quizCount = json['quiz_count'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_time'] = createdTime;
    data['name'] = name;
    if (quiz != null) {
      data['quiz'] = quiz!.map((v) => v.toJson()).toList();
    }
    data['quiz_count'] = quizCount;
    data['duration'] = duration;
    return data;
  }
}

class Quiz {
  String? question;
  List<String>? options;

  Quiz({this.question, this.options});

  Quiz.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['options'] = options;
    return data;
  }
}
