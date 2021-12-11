// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/screens/Landing/Screen%20User%20Profile/user_profile.dart';
import 'package:pahiream_frontend/screens/Landing/Widgets/Header/header.dart';

class DesktopLanding extends StatelessWidget {
  const DesktopLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;
    const String destination = '/userProfile';
    // const String destination = '/mainPage';
    // const String destination = '/userProfile';

    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            AppHeader(),
            destination == '/userProfile'
                ? UserProfile()
                : destination == '/mainPage'
                    ? Text('Main Page')
                    : SizedBox(),
          ],
        ),
      ),
    );
  }
}
