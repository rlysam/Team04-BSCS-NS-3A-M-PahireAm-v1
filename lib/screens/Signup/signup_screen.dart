import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

import 'signup_api.dart';
import 'user.dart';
import 'dart:developer';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _ctrlUserFname = TextEditingController();
  final TextEditingController _ctrlUserLname = TextEditingController();
  final TextEditingController _ctrlUserTUPId = TextEditingController();
  final TextEditingController _ctrlUserEmail = TextEditingController();
  final TextEditingController _ctrlUserPassword = TextEditingController();
  final TextEditingController _ctrlUserPassword2 = TextEditingController();
  final TextEditingController _ctrlUserVerificationCode =
      TextEditingController();
  bool userNotExist = true;
  bool rightCode = true;
  var jsonObjectCode;
  late String strCode;
  // Future<User>?
  //     _futureVerCode; //dadalin 'to sa user profile Future User from database if status code == 201
  Future<User>?
      _futureUser; //dadalin 'to sa user profile Future User from database if status code == 201

  findUser() => setState(() => userNotExist = false);
  makeWrongCode() => setState(() => rightCode = false);

  @override
  void dispose() {
    super.dispose();
    _ctrlUserFname.dispose();
    _ctrlUserLname.dispose();
    _ctrlUserTUPId.dispose();
    _ctrlUserEmail.dispose();
    _ctrlUserPassword.dispose();
    _ctrlUserPassword2.dispose();
    _ctrlUserVerificationCode.dispose();
  }

  Dialog showVerificationDialog() {
    return Dialog(
      child: Container(
          width: 490,
          height: 380,
          padding: EdgeInsets.symmetric(vertical: 23, horizontal: 28),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffFFFFFF)),
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Text(
                'Verify your email',
                style: CommonStyleText.txtStyle(size: pToF(64), weigth: bold),
              ),
              TextField(
                controller: _ctrlUserVerificationCode,
                decoration: CommonStyleInput.textFieldStyle(
                    hintTextStr: 'Enter verification code'),
              ),
              rightCode
                  ? const SizedBox()
                  : Text('wrong code',
                      style: CommonStyleText.txtStyle(
                          color: kFontColorRedWarning)),
              ElevatedButton(
                style:
                    CommonStyleButton.btnStyle(hintTextStr: 'Enter Code Here'),
                onPressed: () {
                  if (jsonObjectCode['code'] ==
                      _ctrlUserVerificationCode.text) {
                    print("success");
                    getTheUser(); //after mag dialog
                  } else {
                    makeWrongCode();
                  }
                },
                child: Text('Verify',
                    style: CommonStyleText.txtStyle(color: kWhite)),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryPink,
                  image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage('https://i.imgur.com/CSdSJoJ.png'))),
            ),
          ),
          Expanded(
              child: Center(
            child: Container(
              // constraints: BoxConstraints(maxWidth: 240),
              padding: EdgeInsets.symmetric(horizontal: pToF(120)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account',
                    style:
                        CommonStyleText.txtStyle(size: pToF(64), weigth: bold),
                  ),
                  SizedBox(height: pToF(70)),
                  Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: CommonStyleText.txtStyle(weigth: medium),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextFormField(
                                controller: _ctrlUserFname,
                                decoration: CommonStyleInput.textFieldStyle(),
                                //lalagyan dito ng controller, tapos kapag may ganon na na email sa database, wag na tumuloy
                              ),
                            ),
                          ]),
                      SizedBox(width: pToF(20)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name',
                              style: CommonStyleText.txtStyle(weigth: medium),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextFormField(
                                controller: _ctrlUserLname,
                                decoration: CommonStyleInput.textFieldStyle(),
                                //lalagyan dito ng controller, tapos kapag may ganon na na email sa database, wag na tumuloy
                              ),
                            ),
                          ]),
                    ],
                  ),
                  SizedBox(height: pToF(20)),
                  Text(
                    'TUP ID Number',
                    style: CommonStyleText.txtStyle(weigth: medium),
                  ),
                  SizedBox(
                    width: 240,
                    child: TextFormField(
                      controller: _ctrlUserTUPId,
                      decoration: CommonStyleInput.textFieldStyle(),
                      //lalagyan dito ng controller, tapos kapag may ganon na na email sa database, wag na tumuloy
                    ),
                  ),
                  SizedBox(height: pToF(20)),
                  Text(
                    'TUP Email',
                    style: CommonStyleText.txtStyle(weigth: medium),
                  ),
                  TextFormField(
                    controller: _ctrlUserEmail,
                    decoration: CommonStyleInput.textFieldStyle(),
                    //lalagyan dito ng controller, tapos kapag may ganon na na email sa database, wag na tumuloy
                  ),
                  SizedBox(height: pToF(20)),
                  Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: CommonStyleText.txtStyle(weigth: medium),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextFormField(
                                controller: _ctrlUserPassword,
                                decoration: CommonStyleInput.textFieldStyle(),
                                //lalagyan dito ng controller, tapos kapag may ganon na na email sa database, wag na tumuloy
                              ),
                            ),
                          ]),
                      SizedBox(width: pToF(20)),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Confirm Password',
                              style: CommonStyleText.txtStyle(weigth: medium),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextFormField(
                                controller: _ctrlUserPassword2,
                                decoration: CommonStyleInput.textFieldStyle(),
                                //lalagyan dito ng controller, tapos kapag may ganon na na email sa database, wag na tumuloy
                              ),
                            ),
                          ]),
                    ],
                  ),
                  SizedBox(
                    height: pToF(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: pToF(350),
                        child: ElevatedButton(
                          onPressed: () async {
                            //dito lalagay yung function na JsonEncode
                            //pag correct, lilipat ng screen, pag hindi, dito lang for no30w
                            // 1. Show dialog email verification
                            // 2. after verification, and confirmed verification
                            // 3. create user
                            // laman neto is yung passcode
                            jsonObjectCode = await getCode(_ctrlUserEmail.text,
                                _ctrlUserTUPId.text, () {});
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return showVerificationDialog();
                                });
                            // Navigator.pop(context);
                          },
                          child: Text(
                            'Register',
                            style: CommonStyleText.txtStyle(
                                size: pToF(24), color: kWhite, weigth: medium),
                          ),
                          style: CommonStyleButton.btnStyle(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
        ],
      )),
    );
  }

  void getTheUser() {
    return setState(() {
      _futureUser = createUser(
        _ctrlUserFname.text,
        _ctrlUserLname.text,
        _ctrlUserTUPId.text,
        _ctrlUserEmail.text,
        _ctrlUserPassword.text,
      );
    });
  }
}
