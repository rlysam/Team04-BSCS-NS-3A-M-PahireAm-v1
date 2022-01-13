// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  /*
    buttonSetting can be:
                      Account
                      Post
                      Item
                      Settings
   */

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String changePasswordOrDiscard = 'Change Password';
  String editOrSave = 'Edit Profile';
  bool isColor1 = true;
  bool isColor2 = true;
  bool isColor3 = true;
  bool isColor4 = true;
  @override
  Widget build(BuildContext context) {
    String buttonSetting = 'Account';
    bool isVisible = true;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPaddingPagesDesktop),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('Account'),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
              //padding: EdgeInsets.all(10.0),
              decoration: divDecoration(),
              child: Row(
                //Whole Jane Doe
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePicture(radius2: 100, radius3: 95, radius4: 90),
                  SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Naruto Uzumaki',
                            style: CommonStyleText.txtStyle(
                                size: 40, weigth: bold)),
                        SizedBox(height: 20),
                        SubDetailsSection(),
                        SizedBox(height: 20),
                        LevelIndicatorSection(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  //Settings
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text('Settings'),
                      //Account
                      //SizedBox(height: 10),
                      RaisedButton(
                        color: isColor1
                            ? Colors.grey.shade50
                            : Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                          side: isColor1
                              ? BorderSide(color: Colors.grey, width: 1)
                              : BorderSide(color: kPrimaryPink, width: 1),
                        ),
                        // 3
                        onPressed: () => {
                          setState(() {
                            isColor1 = !isColor1;
                            //buttonSetting = 'Account';
                          })
                        },
                        //decoration: divDecoration(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.account_box,
                              color: Colors.grey,
                              size: 30.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            SizedBox(width: 20),
                            SizedBox(height: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Account',
                                    style: CommonStyleText.txtStyle(
                                        size: 15, weigth: bold)),
                                Text('Personal Information',
                                    style: CommonStyleText.txtStyle(size: 10)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Post
                      SizedBox(height: 10),
                      RaisedButton(
                        color: isColor2
                            ? Colors.grey.shade50
                            : Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                          side: isColor2
                              ? BorderSide(color: Colors.grey, width: 1)
                              : BorderSide(color: kPrimaryPink, width: 1),
                        ),
                        onPressed: () {
                          isColor2 = !isColor2;
                          buttonSetting = 'Post';
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.location_pin,
                              color: Colors.grey,
                              size: 30.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            SizedBox(width: 20),
                            SizedBox(height: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Post',
                                    style: CommonStyleText.txtStyle(
                                        size: 15, weigth: bold)),
                                Text('Pasabay & Pahiram post',
                                    style: CommonStyleText.txtStyle(size: 10)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Item
                      SizedBox(height: 10),
                      RaisedButton(
                        color: isColor3
                            ? Colors.grey.shade50
                            : Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                          side: isColor3
                              ? BorderSide(color: Colors.grey, width: 1)
                              : BorderSide(color: kPrimaryPink, width: 1),
                        ),
                        onPressed: () {
                          isColor3 = !isColor3;
                          buttonSetting = 'Item';
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.inventory_2_rounded,
                              color: Colors.grey,
                              size: 30.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            SizedBox(width: 20),
                            SizedBox(height: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Item',
                                    style: CommonStyleText.txtStyle(
                                        size: 15, weigth: bold)),
                                Text('Pasabay & Pahiram item',
                                    style: CommonStyleText.txtStyle(size: 10)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Settings
                      SizedBox(height: 10),
                      RaisedButton(
                        color: isColor4
                            ? Colors.grey.shade50
                            : Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                          side: isColor4
                              ? BorderSide(color: Colors.grey, width: 1)
                              : BorderSide(color: kPrimaryPink, width: 1),
                        ),
                        onPressed: () {
                          isColor4 = !isColor4;
                          buttonSetting = 'Settings';
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Icon(
                              Icons.settings,
                              color: Colors.grey,
                              size: 30.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            SizedBox(width: 20),
                            SizedBox(height: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Settings',
                                    style: CommonStyleText.txtStyle(
                                        size: 15, weigth: bold)),
                                Text('Account settings',
                                    style: CommonStyleText.txtStyle(size: 10)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //About
                SizedBox(width: 20),
                //SizedBox(height: 30),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      // Expanded(
                      //child:
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        //padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 40.0),
                        //padding: EdgeInsets.all(10.0),
                        decoration: divDecoration(),

                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //Account Button when clicked
                            /*
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('About', style: CommonStyleText.txtStyle(size: 30, weigth: bold)),
                                    OutlinedButton(
                                      onPressed: (){
                                        buttonSetting = 'Settings';
                                        print(buttonSetting);
                                        print('Hotbikiridog');
                                        buttonSetting = 'Post';
                                      },
                                      child:
                                      Text('Edit Profile'),
                                      style: OutlinedButton.styleFrom(
                                        primary: kPrimaryPink,
                                        textStyle: TextStyle(
                                          color: kPrimaryPink,
                                          fontSize: 15,
                                        ),
                                        side: BorderSide(color: kPrimaryPink, width: 1),
                                      ),
                                    ),
                                  ],
                              ),
                              SettingAccount(),
                              */

                            //Post Button when Clicked
                            /*
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Post', style: CommonStyleText.txtStyle(size: 30, weigth: bold)),
                                    Container(
                                      child:
                                          Row(
                                            children: [
                                              Text(
                                                myValue ? 'Pahiram' : 'Pasabay',
                                                style: CommonStyleText.txtStyle(
                                                    color: myValue ? kPrimaryGreen : kPrimaryPink,
                                                    size: 15,
                                                    weigth: bold),
                                              ),
                                              //SizedBox(width: 1),
                                              Transform.scale(
                                                scale: 1.0,
                                                child: Switch(
                                                    activeColor: kPrimaryGreen,
                                                    inactiveThumbColor: kPrimaryPink,
                                                    inactiveTrackColor: kPrimaryPink.withOpacity(.5),
                                                    value: myValue,
                                                    onChanged: (value) =>
                                                        setState(() => myValue = value)),
                                              ),
                                            ],
                                          ),
                                    ),

                                  ],
                                ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                  child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SettingPost(),
                                    ],
                                  ),
                              ),
                                */

                            //Item Button when Clicked
                            /*
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Item', style: CommonStyleText.txtStyle(size: 30, weigth: bold)),
                                  Container(
                                    child:
                                    Row(
                                      children: [
                                        Text(
                                          myValue ? 'Pahiram' : 'Pasabay',
                                          style: CommonStyleText.txtStyle(
                                              color: myValue ? kPrimaryGreen : kPrimaryPink,
                                              size: 15,
                                              weigth: bold),
                                        ),
                                        //SizedBox(width: 1),
                                        Transform.scale(
                                          scale: 1.0,
                                          child: Switch(
                                              activeColor: kPrimaryGreen,
                                              inactiveThumbColor: kPrimaryPink,
                                              inactiveTrackColor: kPrimaryPink.withOpacity(.5),
                                              value: myValue,
                                              onChanged: (value) =>
                                                  setState(() => myValue = value)),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SettingPost(),
                                  ],
                                ),
                              ),
                              */

                            //Settings Button when clicked

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Settings',
                                    style: CommonStyleText.txtStyle(
                                        size: 30, weigth: bold)),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {
                                          changePasswordOrDiscard = 'Cancel';
                                          editOrSave = 'Save changes';
                                        },
                                        child: Text(changePasswordOrDiscard),
                                        style: OutlinedButton.styleFrom(
                                          primary: Colors.grey,
                                          textStyle: TextStyle(
                                            color: kPrimaryPink,
                                            fontSize: 15,
                                          ),
                                          side: BorderSide(
                                              color: Colors.grey, width: 1),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      OutlinedButton(
                                        onPressed: () {
                                          buttonSetting = 'Settings';
                                          changePasswordOrDiscard =
                                              'Discard changes';
                                          editOrSave = 'Save Changes';
                                        },
                                        child: Text('Edit Profile'),
                                        style: OutlinedButton.styleFrom(
                                          primary: kPrimaryPink,
                                          textStyle: TextStyle(
                                            color: kPrimaryPink,
                                            fontSize: 15,
                                          ),
                                          side: BorderSide(
                                              color: kPrimaryPink, width: 1),
                                        ),
                                      ),
                                    ])
                              ],
                            ),
                            SettingSettings(),

                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//Setting Settings
class SettingSettings extends StatefulWidget {
  const SettingSettings({
    Key? key,
  }) : super(key: key);

  @override
  _SettingSettingsState createState() => _SettingSettingsState();
}

class _SettingSettingsState extends State<SettingSettings> {
  @override
  Widget build(BuildContext context) {
    String lastName = 'Uzumaki';
    String firstName = 'Naruto';
    var tupID = 'TUPM-19-2401';
    var birthday = '03-31-00';
    var contact = '(02) 1234 - 5678';
    String gender = 'Male';
    String email = 'uzumaki.naruto@tup.edu.ph';
    String college = 'College of Science';
    String course = 'Bachelor of Science in Computer Science';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        details(lastName, firstName, contact, email, gender, college, course,
            birthday, tupID),
      ],
    );
  }

  // Details including Name, Contact No., Email
  Expanded details(
      String lastName,
      String firstName,
      String contact,
      String email,
      String gender,
      String college,
      String course,
      String birthday,
      String tupID) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('First Name',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  Text(firstName,
                      style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                  SizedBox(height: 10),
                  Text('Gender',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  Text(gender,
                      style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                  SizedBox(height: 10),
                  Text('College',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  Text(college,
                      style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Last Name',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  Text(lastName,
                      style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                  SizedBox(height: 10),
                  Text('Contact No.',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  Text(contact,
                      style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                  SizedBox(height: 10),
                  //Text('Course', style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  //Text(course,  style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                ],
              ),
              SizedBox(width: 120),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  Text(email,
                      style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                  SizedBox(height: 10),
                  Text('TUP ID',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  Text(tupID,
                      style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                  SizedBox(height: 10),
                  Text('Course',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10)),
                  Text(course,
                      style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
                ],
              ),

              /*
              SizedBox(height: 10),
              Text('Email', style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 10)),
              Text(email,  style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
              SizedBox(height: 10),


               */
            ],
          )
        ],
      ),
    );
  }
}

//Setting Account
class SettingAccount extends StatefulWidget {
  const SettingAccount({
    Key? key,
  }) : super(key: key);

  @override
  _SettingAccountState createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
  @override
  Widget build(BuildContext context) {
    var name = 'Uzumaki Naruto';
    var birthday = '03-31-00';
    var contact = '(02) 1234 - 5678';
    var gender = 'Male';
    var email = 'uzumaki.naruto@tup.edu.ph';
    var course = 'Bachelor of Science in Computer Science';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 70),
        details(name, contact, email),
        details_2(birthday, gender, course),
      ],
    );
  }

  // Details including Name, Contact No., Email
  Expanded details(String name, String contact, String email) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Name',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5), fontSize: 10)),
          Text('   ' + name,
              style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
          SizedBox(height: 10),
          Text('Contact No.',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5), fontSize: 10)),
          Text('   ' + contact,
              style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
          SizedBox(height: 10),
          Text('Email',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5), fontSize: 10)),
          Text('   ' + email,
              style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  //Details including Birthday, Gender, Course
  Expanded details_2(String birthday, String gender, String course) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Birthday',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5), fontSize: 10)),
          Text('   ' + birthday,
              style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
          SizedBox(height: 10),
          Text('Gender',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5), fontSize: 10)),
          Text('   ' + gender,
              style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
          SizedBox(height: 10),
          Text('Course',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5), fontSize: 10)),
          Text('   ' + course,
              style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

//Setting Post
class SettingPost extends StatefulWidget {
  const SettingPost({
    Key? key,
  }) : super(key: key);

  @override
  _SettingPostState createState() => _SettingPostState();
}

class _SettingPostState extends State<SettingPost> {
  @override
  Widget build(BuildContext context) {
    var name = 'Uzumaki Naruto';
    var birthday = '03-31-00';
    var contact = '(02) 1234 - 5678';
    var gender = 'Male';
    var email = 'uzumaki.naruto@tup.edu.ph';
    var course = 'Bachelor of Science in Computer Science';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //child: new SingleChildScrollView(
        Text('Post CArds HErE'),
        Text('Post CArds HErE')

        // PasabayCards(),
        // PasabayCards()

        //SizedBox(width: 70),
        //SizedBox(height: 100),
        //SizedBox(width: 70),
        //details(name, contact, email),
        //),

        //SizedBox(width: 120),
        //details(nameString, name),
        //editProfile(),
/*
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //details(nameString, name),
              Text('Basic', style: TextStyle(color: kPrimaryGreen, fontWeight: FontWeight.bold)),
              Text('Level', style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 10),),
            ],
          ),
        ),

 */

        //Expanded(child: SizedBox(height: 30)),
      ],
    );
  }

  // Post - Pasabay and Pahiram Card
  Expanded details(String name, String contact, String email) {
    return Expanded(
      //child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Post CArds HErE')
          //   PasabayCards(),
          //PasabayCards(),
          //PasabayCards(),
        ],
      ),
      //),
    );
  }

/*
  Expanded editProfile() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hotdog',  style: CommonStyleText.txtStyle(size: 20, weigth: bold)),
          Text('Hoootdog',  style: CommonStyleText.txtStyle(size: 20, weigth: bold)),

        ],
      ),
    );
  }

 */
}

class LevelIndicatorSection extends StatelessWidget {
  const LevelIndicatorSection({
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
              Text('Basic',
                  style: TextStyle(
                      color: kPrimaryGreen, fontWeight: FontWeight.bold)),
              Text(
                'Level',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 10),
              ),
            ],
          ),
        ),
        // SizedBox(width: 45),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                backgroundColor: kGray,
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryGreen),
                minHeight: 10,
                value: 0.8,
              ),
              Row(
                children: [
                  Text('Points: 450/500'),
                  Icon(Icons.bolt, color: Colors.amber)
                ],
              )
            ],
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}

// Yung nasa ilalim ng User Full Name
class SubDetailsSection extends StatelessWidget {
  const SubDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var department = 'College of Science';
    var collegeString = 'College';
    var tupEmail = 'uzumaki.naruto@tup.edu.ph';
    var emailString = 'Email';
    var studentNumber = 'TUPM-19-2401';
    var idString = 'id';

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        details(department, collegeString),
        details(tupEmail, emailString),
        details(studentNumber, idString),
      ],
    );
  }

  Expanded details(String data, String data2) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data, style: CommonStyleText.txtStyle(size: 15, weigth: bold)),
          Text(data2,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 10))
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  var radius2 = 125.0;
  var radius3 = 120.0;
  var radius4 = 115.0;

  ProfilePicture({
    required this.radius2,
    required this.radius3,
    required this.radius4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchButtonCubit, bool>(
      builder: (context, isPasabay) {
        return CircleAvatar(
          radius: radius2,
          backgroundColor: isPasabay? kPrimaryGreen : kPrimaryPink,
          child: CircleAvatar(
              radius: radius3,
              backgroundColor: kWhite,
              child: CircleAvatar(
                radius: radius4,
                backgroundImage: NetworkImage(profilePictureURL),
              )),
        );
      },
    );
    // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
  }
}
