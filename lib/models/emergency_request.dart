import 'user_model.dart';

class EmergencyRequest {
  final UserModel user;
  final String severity;
  final String status;
  final String? assignedKinGuard;

  EmergencyRequest({
    required this.user,
    required this.severity,
    required this.status,
    this.assignedKinGuard,
  });
}
