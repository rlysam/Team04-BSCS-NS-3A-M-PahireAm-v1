// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/widgets/pahiream_switch.dart';
import 'package:pahiream_frontend/features/profile/presentation/pages/user_profile.dart';
import 'package:pahiream_frontend/main.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';
import 'package:provider/provider.dart';

class MyDesktopHeader extends StatefulWidget {
  const MyDesktopHeader({Key? key}) : super(key: key);

  @override
  State<MyDesktopHeader> createState() => _MyDesktopHeaderState();
}

class _MyDesktopHeaderState extends State<MyDesktopHeader> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool myValue = Provider.of<GlobalDataPahireAm>(context).isPasabay;
    print('\n\n\nSwitch VALUE: $myValue\n\n\n');
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
                          'Pahire',
                          style: CommonStyleText.txtStyle(
                              color: kPrimaryGreen, size: 30, weigth: bold),
                        ),
                        Text(
                          'Am',
                          style: CommonStyleText.txtStyle(
                              color: kPrimaryPink, size: 30, weigth: bold),
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
                Row(
                  children: [
                    //   TODO: Baka hindi mag render, dahil Row inside Row
                    SwitchPahireAm(),
                    SizedBox(width: 30),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ProfilePicture(
                            radius2: 30, radius3: 27, radius4: 23)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

