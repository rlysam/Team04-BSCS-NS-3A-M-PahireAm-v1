// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/header.dart';
import 'package:pahiream_frontend/features/profile/presentation/pages/user_profile.dart';

class DesktopLanding extends StatelessWidget {
  const DesktopLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;
    // const String destination = '/userProfile';
    const String destination = '/mainPage';
    // const String destination = '/userProfile';

    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            AppHeader(),
            // destination == '/userProfile'
            //     ? UserProfile()
            //     : destination == '/mainPage'
            //         ? PahiramContents()
            //         : SizedBox(),
          ],
        ),
      ),
    );
  }
}
