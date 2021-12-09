import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/Responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopBody;
  final Widget mobileBody;

  const ResponsiveLayout(
      {Key? key, required this.desktopBody, required this.mobileBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < tabletWidth) {
        return desktopBody;
      } else {
        return mobileBody;
      }
    });
  }
}
