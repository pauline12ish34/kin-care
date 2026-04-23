import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/emergency_request.dart';

class AppProvider extends ChangeNotifier {
  UserModel? user;
  EmergencyRequest? currentRequest;

  void setUser(UserModel newUser) {
    user = newUser;
    notifyListeners();
  }

  void setRequest(EmergencyRequest request) {
    currentRequest = request;
    notifyListeners();
  }

  void clearRequest() {
    currentRequest = null;
    notifyListeners();
  }
}
