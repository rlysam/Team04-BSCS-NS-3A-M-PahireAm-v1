import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/login/presentation/pages/login_page.dart';
import 'package:pahiream_frontend/features/main_page/screen/landing_screen.dart';
import 'package:pahiream_frontend/features/signup/presentation/pages/signup_screen.dart';
import 'package:pahiream_frontend/utils/constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) {
          return const CustomSplashPahireAm(child: LandingPage());
        });
      case '/loginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signUpPage':
        return MaterialPageRoute(builder: (_) => const SignupPage());
      // ! sam ganito yung sa Landing page... pass _futureUser as argument
      case '/landingPage':
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

class CustomSplashPahireAm extends StatefulWidget {
  const CustomSplashPahireAm({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<CustomSplashPahireAm> createState() => _CustomSplashPahireAmState();
}

class _CustomSplashPahireAmState extends State<CustomSplashPahireAm>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //   var logo =  Image.asset('assets/images/logo.gif');
    var logo = Image.asset('assets/images/Vector.png');
    return AnimatedSplashScreen(
        duration: 2000, //mili sec
        splash: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: logo,
        ),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: kPrimaryGreen,
        nextScreen: widget.child);
  }
}
