import '../models/emergency_request.dart';

class EmergencyService {
  // Mock create request for demo
  Future<EmergencyRequest> createRequest(EmergencyRequest request) async {
    await Future.delayed(Duration(seconds: 1));
    return request;
  }

  // Mock update status
  Future<EmergencyRequest> updateStatus(EmergencyRequest request, String status) async {
    await Future.delayed(Duration(seconds: 1));
    return EmergencyRequest(
      user: request.user,
      severity: request.severity,
      status: status,
      assignedKinGuard: request.assignedKinGuard,
    );
  }
}
