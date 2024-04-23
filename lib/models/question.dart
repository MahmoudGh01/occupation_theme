class Question {
  String question;
  List<String> options;
  int correct;

  Question({required this.question, required this.options,required this.correct});

    Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'correct': correct,
    };
  }

  factory Question.fromJson(Map<String, dynamic> json) {
  return Question(
    question: json['question'],
    options: List<String>.from(json['options']),
    correct: json.containsKey('correct_index') ? json['correct_index'] : json['correct'], // Gérer la différence dans les noms des clés
  );
}
}
