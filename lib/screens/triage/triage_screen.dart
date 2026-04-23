import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/triage_question.dart';
import '../../services/triage_service.dart';
import '../../models/emergency_request.dart';
import '../../providers/app_provider.dart';

class TriageScreen extends StatefulWidget {
  @override
  State<TriageScreen> createState() => _TriageScreenState();
}

class _TriageScreenState extends State<TriageScreen> {
  final TriageService triageService = TriageService();
  late List<TriageQuestion> questions;
  int current = 0;

  @override
  void initState() {
    super.initState();
    questions = triageService.getQuestions();
  }

  void answer(String ans) {
    setState(() {
      questions[current].answer = ans;
      if (current < questions.length - 1) {
        current++;
      } else {
        // Calculate severity
        String severity = triageService.calculateSeverity(questions);
        final user = Provider.of<AppProvider>(context, listen: false).user;
        if (user != null) {
          final request = EmergencyRequest(
            user: user,
            severity: severity,
            status: 'Request received',
            assignedKinGuard: 'Alex (Demo)',
          );
          Provider.of<AppProvider>(context, listen: false).setRequest(request);
        }
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Severity: $severity'),
            content: Text('Thank you! Help is on the way.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/tracker');
                },
                child: Text('Continue'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Triage')), 
      body: Center(
        child: current < questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(questions[current].question, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => answer('Yes'),
                    child: Text('Yes'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => answer('No'),
                    child: Text('No'),
                  ),
                ],
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
