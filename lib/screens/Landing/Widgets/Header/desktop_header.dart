// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/screens/Landing/Screen%20User%20Profile/user_profile.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class MyDesktopHeader extends StatelessWidget {
  const MyDesktopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      alignment: const Alignment(0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 130.0),
        child: Container(
          // color: kPrimaryGreen,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      print('Pindot sa Logo');
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: kPrimaryGreen.withOpacity(0.3),
                            radius: 25,
                            child: FlutterLogo(
                              size: 30,
                            )),
                        SizedBox(width: 10),
                        Text(
                          'PAHIREAM',
                          style:
                              CommonStyleText.txtStyle(size: 20, weigth: bold),
                        ),
                        SizedBox(width: 48),
                        SizedBox(
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                cursorColor: kDark,
                                decoration: CommonStyleInput.textFieldStyle(
                                    myIcon: Icons.search, hasIcon: true),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child:
                        ProfilePicture(radius2: 30, radius3: 27, radius4: 23)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
