import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/Responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopBody;
  final Widget tabletBody;

  const ResponsiveLayout(
      {Key? key, required this.desktopBody, required this.tabletBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var screenWidth = constraints.maxWidth;
      if (screenWidth > tabletWidth) {
        return desktopBody;
      } else {
        return tabletBody;
      }
    });
  }
}
