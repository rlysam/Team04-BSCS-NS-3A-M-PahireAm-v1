// Responsive Header
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/desktop_header.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/tablet_header.dart';
import 'package:pahiream_frontend/utils/Responsive/responsive_layout.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopBody: Column(
        children: const [
          SizedBox(height: 10),
          MyDesktopHeader(),
          SizedBox(height: 10),
          Divider(height: 1, thickness: 1),
        ],
      ),
      tabletBody: const MyTabletHeader(),
    );
  }
}
