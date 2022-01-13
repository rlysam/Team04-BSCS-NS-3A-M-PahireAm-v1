// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/categories/presentation/pages/category_view.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/widgets/main_content.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/widgets/pahiream_switch.dart';
import 'package:pahiream_frontend/features/main_page/screen/landing_screen.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/header.dart';
import 'package:pahiream_frontend/features/profile/presentation/pages/user_profile.dart';
import 'package:pahiream_frontend/utils/constants.dart';

class DesktopLanding extends StatefulWidget {
  const DesktopLanding({Key? key}) : super(key: key);

  @override
  State<DesktopLanding> createState() => _DesktopLandingState();
}

class _DesktopLandingState extends State<DesktopLanding> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;
    // const String destination = '/userProfile';
    const String destination = '/mainPage';
    // const String destination = '/userProfile';

    return Scaffold(
        floatingActionButton: IconButton(onPressed: (){}, icon: Icon(Icons.message)),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            AppHeader(),
            destination == '/userProfile'
                ? UserProfile()
                : destination == '/mainPage'
                    // ? LandingPageUI()
                    ? Expanded(child: LandingPageUI())
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 400, vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 138, child: CategoryBuilder()),
            SizedBox(height: 20),
            MainContent(),
          ],
        ),
      ),
    );
  }
}
