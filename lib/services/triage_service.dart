import '../models/triage_question.dart';

class TriageService {
  // Hardcoded questions for demo
  List<TriageQuestion> getQuestions() {
    return [
      TriageQuestion(question: 'Can you walk?', options: ['Yes', 'No']),
      TriageQuestion(question: 'Do you have chest pain?', options: ['Yes', 'No']),
      TriageQuestion(question: 'Are you having trouble breathing?', options: ['Yes', 'No']),
    ];
  }

  // Simple severity logic for demo
  String calculateSeverity(List<TriageQuestion> questions) {
    int severe = questions.where((q) => q.answer == 'No').length;
    if (severe >= 2) return 'Severe';
    if (severe == 1) return 'Moderate';
    return 'Mild';
  }
}
