// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/screens/Landing/Screen%20User%20Profile/user_profile.dart';
import 'package:pahiream_frontend/screens/Landing/Widgets/Header/header.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class DesktopLanding extends StatelessWidget {
  const DesktopLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: UserProfile());
  }
}
