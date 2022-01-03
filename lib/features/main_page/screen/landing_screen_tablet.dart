import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/screens/Landing/Widgets/Header/header.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class TabletLanding extends StatelessWidget {
  const TabletLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const AppHeader(),
        ],
      ),
    ));
  }
}
