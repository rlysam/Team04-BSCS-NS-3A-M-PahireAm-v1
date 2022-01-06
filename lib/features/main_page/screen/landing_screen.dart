import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/screen/landing_screen_desktop.dart';
import 'package:pahiream_frontend/features/main_page/screen/landing_screen_tablet.dart';
import 'package:pahiream_frontend/utils/Responsive/responsive_layout.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Todo : Implement Switch using Provide package
    bool isPasabay = true;
    return const ResponsiveLayout(
      desktopBody: DesktopLanding(),
      tabletBody: TabletLanding(),
    );
  }
}
