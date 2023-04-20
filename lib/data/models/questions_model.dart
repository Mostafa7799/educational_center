class QuestionsModel {
  int? id;
  int? quizId;
  String? question;
  String? choiceA;
  String? choiceB;
  String? choiceC;
  String? choiceD;
  String? correctAnswer;
  int? grade;
  String? createdAt;
  String? updatedAt;

  QuestionsModel(
      {this.id,
        this.quizId,
        this.question,
        this.choiceA,
        this.choiceB,
        this.choiceC,
        this.choiceD,
        this.correctAnswer,
        this.grade,
        this.createdAt,
        this.updatedAt});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizId = json['quiz_id'];
    question = json['question'];
    choiceA = json['choice_a'];
    choiceB = json['choice_b'];
    choiceC = json['choice_c'];
    choiceD = json['choice_d'];
    correctAnswer = json['correct_answer'];
    grade = json['grade'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}