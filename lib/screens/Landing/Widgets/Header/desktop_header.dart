import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/constants.dart';

class MyDesktopHeader extends StatelessWidget {
  const MyDesktopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(color: kPrimaryPink, height: 50,
    alignment: Alignment(0, 0),
    child: Column(
      children: [
        Text(size.width.toString()+' Size'),
        Text('Ikaw ay nasa Desktop Header'),
      ],
    ),);
  }
}