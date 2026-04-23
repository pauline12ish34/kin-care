class AuthService {
  // Mock login/signup for demo
  Future<bool> login(String phone, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<bool> signup(String phone, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  void logout() {}
}
