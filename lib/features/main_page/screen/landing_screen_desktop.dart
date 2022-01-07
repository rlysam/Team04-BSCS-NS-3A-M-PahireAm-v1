// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/features/categories/presentation/pages/category_view.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/widgets/MainContent.dart';
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
          children: [
            AppHeader(),
            destination == '/userProfile'
                ? UserProfile()
                : destination == '/mainPage'
                    ? LandingPageUI()
                    : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class LandingPageUI extends StatefulWidget {
  LandingPageUI({Key? key}) : super(key: key);

  @override
  _LandingPageUIState createState() => _LandingPageUIState();
}

class _LandingPageUIState extends State<LandingPageUI> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //   TODO Implement categorybuilder
        //   CategoryBuilder()
        MainContent(),
      ],
    );
  }
}