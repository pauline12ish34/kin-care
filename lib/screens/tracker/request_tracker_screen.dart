import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class RequestTrackerScreen extends StatefulWidget {
  @override
  State<RequestTrackerScreen> createState() => _RequestTrackerScreenState();
}

class _RequestTrackerScreenState extends State<RequestTrackerScreen> {
  int status = 0;
  final List<String> states = [
    'Request received',
    'Kin-Guard assigned',
    'Kin-Guard is on the way!',
    'Kin-Guard has arrived!'
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), updateStatus);
  }

  void updateStatus() {
    if (status < states.length - 1) {
      setState(() {
        status++;
      });
      Future.delayed(Duration(seconds: 2), updateStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = Provider.of<AppProvider>(context).currentRequest;
    return Scaffold(
      appBar: AppBar(title: Text('Request Tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 16),
            Text('Kin-Guard: ${request?.assignedKinGuard ?? 'N/A'}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 32),
            Text(states[status], style: TextStyle(fontSize: 22, color: Colors.blue)),
            SizedBox(height: 32),
            if (status == states.length - 1)
              ElevatedButton(
                onPressed: () {
                  Provider.of<AppProvider>(context, listen: false).clearRequest();
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                child: Text('Back to Home'),
              ),
          ],
        ),
      ),
    );
  }
}
