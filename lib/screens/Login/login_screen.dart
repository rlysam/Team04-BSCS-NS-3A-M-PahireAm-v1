import 'package:flutter/material.dart';
import 'package:pahiream_frontend/screens/Login/login_api.dart';
import 'package:pahiream_frontend/screens/Signup/user.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _ctrlUserEmail = TextEditingController();
  final TextEditingController _ctrlUserPass = TextEditingController();
  bool correctPassword = true; //true = initial value, para hindi error pakita
  bool userExist = true; //true = initial value, para hindi error pakita
  Future<User>? _futureUser;

  wrongPass() => setState(() => correctPassword = false);
  notFound() => setState(() => userExist = false);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Expanded(
            child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: CommonStyleText.txtStyle(size: pToF(64), weigth: bold),
                ),
                SizedBox(
                  height: pToF(30),
                ),
                Text(
                  'Sign in with your data that you entered during your registration',
                  style: CommonStyleText.txtStyle(),
                ),
                SizedBox(height: pToF(70)),
                Text(
                  'TUP Email',
                  style: CommonStyleText.txtStyle(weigth: medium),
                ),
                TextFormField(
                  cursorColor: kDark, controller: _ctrlUserEmail,
                  decoration:
                      CommonStyleInput.textFieldStyle(isCorrect: userExist),
                  //lalagyan dito ng controller, tapos kapag may ganon na na email sa database, wag na tumuloy
                ),
                SizedBox(height: userExist ? 0 : pToF(10)),
                userExist
                    ? const SizedBox()
                    : Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: kFontColorRedWarning,
                            size: 16,
                          ),
                          SizedBox(width: pToF(10)),
                          Text(
                            'Account does not exist',
                            style: CommonStyleText.txtStyle(
                                size: pToF(15),
                                color: kFontColorRedWarning,
                                weigth: medium),
                          )
                        ],
                      ),
                SizedBox(height: pToF(20)),
                Text(
                  'Password',
                  style: CommonStyleText.txtStyle(weigth: medium),
                ),
                TextFormField(
                  cursorColor: kDark,
                  controller: _ctrlUserPass,
                  decoration: CommonStyleInput.textFieldStyle(
                      isCorrect: correctPassword),
                ),
                SizedBox(height: correctPassword ? 0 : pToF(10)),
                correctPassword
                    ? const SizedBox()
                    : Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: kFontColorRedWarning,
                            size: 16,
                          ),
                          SizedBox(width: pToF(10)),
                          Text(
                            'Wrong Password. Please try again or press Forgot Password.',
                            style: CommonStyleText.txtStyle(
                                size: pToF(15),
                                color: kFontColorRedWarning,
                                weigth: medium),
                          )
                        ],
                      ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      // kung ayaw ng may ripple effect
                      // style: ElevatedButton.styleFrom(
                      //   splashFactory: NoSplash.splashFactory,
                      // ),
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style: CommonStyleText.txtStyle(color: kPrimaryGreen),
                      )),
                ),
                SizedBox(
                  height: pToF(30),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //pag correct, lilipat ng screen, pag hindi, dito lang for now
                      _futureUser = fetchUser(_ctrlUserEmail.text,
                          _ctrlUserPass.text, wrongPass, notFound);
                    },
                    child: Text(
                      'Login',
                      style: CommonStyleText.txtStyle(
                          size: pToF(24), color: kWhite, weigth: medium),
                    ),
                    style: CommonStyleButton.btnStyle(),
                  ),
                )
              ],
            ),
          ),
        )),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: kPrimaryPink,
                image: const DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage('https://i.imgur.com/CSdSJoJ.png'))),
          ),
        ),
      ],
    ));
  }
}
