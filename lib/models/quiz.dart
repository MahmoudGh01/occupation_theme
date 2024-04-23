import 'package:job_seeker/models/question.dart';


class Quiz {
   String id;
   String theme;
   List<Question> questions ;

   Quiz({required this.id , required this.theme , required this.questions});

   factory Quiz.fromJson(Map<String, dynamic> json) {
  return Quiz(
    id: json['_id'],
    theme: json['theme'],
    questions: (json['questions'] as List).map((questionJson) => Question.fromJson(questionJson)).toList(),
  );
}
   
}