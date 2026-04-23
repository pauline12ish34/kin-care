import 'package:flutter/material.dart';
import '../screens/onboarding/splash_screen.dart';
import '../screens/onboarding/login_screen.dart';
import '../screens/onboarding/profile_setup_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/triage/triage_screen.dart';
import '../screens/tracker/request_tracker_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileSetupScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/triage':
        return MaterialPageRoute(builder: (_) => TriageScreen());
      case '/tracker':
        return MaterialPageRoute(builder: (_) => RequestTrackerScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for \'${settings.name}\'')),
          ),
        );
    }
  }
}
