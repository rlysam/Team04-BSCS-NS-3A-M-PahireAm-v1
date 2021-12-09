import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(size.width.toString()),
          ],
        ),
      ),
    );
  }
}
