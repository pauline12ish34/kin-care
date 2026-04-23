class TriageQuestion {
  final String question;
  final List<String> options;
  String? answer;

  TriageQuestion({
    required this.question,
    required this.options,
    this.answer,
  });
}
