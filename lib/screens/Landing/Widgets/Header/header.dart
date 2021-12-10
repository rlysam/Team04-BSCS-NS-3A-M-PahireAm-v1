// Responsive Header
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/screens/Landing/Widgets/Header/desktop_header.dart';
import 'package:pahiream_frontend/screens/Landing/Widgets/Header/tablet_header.dart';
import 'package:pahiream_frontend/utils/Responsive/responsive_layout.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopBody: Column(
        children: [
          MyDesktopHeader(),
            Divider(height: 1,thickness: 1,),
        ],
      ),
      tabletBody: MyTabletHeader(),
    );
  }
}
