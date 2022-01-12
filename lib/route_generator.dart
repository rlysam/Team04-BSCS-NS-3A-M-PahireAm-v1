import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/login/presentation/pages/login_page.dart';
import 'package:pahiream_frontend/features/main_page/screen/landing_screen.dart';
import 'package:pahiream_frontend/features/profile/presentation/pages/user_profile.dart';
import 'package:pahiream_frontend/features/signup/presentation/pages/signup_screen.dart';
import 'package:pahiream_frontend/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(
        //     builder: (_) => AnimatedSplashScreen(
        //         duration: 3000, splash: Icons.face,

        //        splashTransition: SplashTransition.fadeTransition,
        //   backgroundColor: Colors.blue ,
        //         nextScreen: LandingPage()));
        // case '/':ile
        // return MaterialPageRoute(builder: (_) => const UserProfile());
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case '/loginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signUpPage':
        return MaterialPageRoute(builder: (_) => const SignupPage());
      // ! sam ganito yung sa Landing page... pass _futureUser as argument
      case '/signLandingPage':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(builder: (_) => const LandingPage());
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
