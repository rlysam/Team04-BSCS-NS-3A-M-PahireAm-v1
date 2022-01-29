// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/categories/presentation/pages/category_view.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/widgets/main_content.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Floating%20Action%20Button/floatingButton.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/header.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/landing_location_cubit.dart';
import 'package:pahiream_frontend/features/profile/presentation/pages/user_profile.dart';

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

    // String destination = '/mainPage';
    String destination = '/userProfile';

    return Scaffold(
        floatingActionButton: FloatingBtnPahireAm(),
      body: BlocBuilder<LandingLocationCubit, bool>(
        builder: (context, mainLocation) {
            if (!mainLocation) {
                destination='/userProfile';
            } else {
                destination='/mainPage';
            }
          return SizedBox(
            height: size.height,
            child: Column(
              children: [
                AppHeader(),
                destination == '/userProfile'
                    ? Expanded(
                        child: UserProfilePageUI(),
                      )
                    : destination == '/mainPage'
                        ? Expanded(child: LandingPageUI())
                        : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserProfilePageUI extends StatefulWidget {
  UserProfilePageUI({Key? key}) : super(key: key);

  @override
  _UserProfilePageUIState createState() => _UserProfilePageUIState();
}

class _UserProfilePageUIState extends State<UserProfilePageUI> {
  @override
  Widget build(BuildContext context) {
    return UserProfile();
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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50),
          SizedBox(height: 160/1.5, child: CategoryBuilder()),
          SizedBox(height: 20),
          Padding( padding: EdgeInsets.symmetric(horizontal: 400),
            child: MainContent(),
          ),
        ],
      ),
    );
  }
}
