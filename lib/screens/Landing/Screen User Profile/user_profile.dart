// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/screens/Landing/Widgets/Header/header.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('Account'),
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
              decoration: divDecoration(),
              child: Row(
                //Whole Jane Doe
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePicture(),
                  SizedBox(width: 40),
                  Expanded(
                    child: Container(
                      // ! debug
                      //   color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Jane Doe',
                              style: CommonStyleText.txtStyle(
                                  size: 40, weigth: bold)),
                          SizedBox(height: 20),
                          SubDetails(),
                          SizedBox(height: 20),
                          LevelIndicator(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Savior'),
              Text('Level'),
            ],
          ),
        ),
        // SizedBox(width: 45),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LinearProgressIndicator(
              //   value: 0.9,
              //   backgroundColor: Colors.grey[300],
              // ),
              Text('****************'),
              Row(
                children: [
                  Text('Points: 450/500'),
                  Icon(Icons.bolt, color: Colors.amber)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

// Yung nasa ilalim ng User Full Name
class SubDetails extends StatelessWidget {
  const SubDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = 'Title';
    var data2 = 'Substitle';

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        details(data, data2),
        // SizedBox(width: 30),
        details(data, data2),
        // SizedBox(width: 30),
        details(data, data2),
      ],
    );
  }

  Expanded details(String data, String data2) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(data), Text(data2)],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url =
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';
    return CircleAvatar(
      radius: 125,
      backgroundColor: kPrimaryGreen,
      child: CircleAvatar(
          radius: 120,
          backgroundColor: kWhite,
          child: CircleAvatar(
            radius: 115,
            backgroundImage: NetworkImage(url),
          )),
    );
    // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
  }
}
