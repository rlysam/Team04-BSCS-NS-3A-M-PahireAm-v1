import 'package:flutter/material.dart';
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
                  decoration: CommonStyleInput.textFieldStyle(),
                  //lalagyan dito ng controller, tapos kapag may ganon na na email sa database, wag na tumuloy
                ),
                SizedBox(height: pToF(20)),
                Text(
                  'Password',
                  style: CommonStyleText.txtStyle(weigth: medium),
                ),
                TextFormField(
                  cursorColor: kDark,
                  controller: _ctrlUserPass,
                  decoration: CommonStyleInput.textFieldStyle(),
                ),
                SizedBox(
                  height: pToF(30),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //dito lalagay yung function na JsonEncode
                      //pag correct, lilipat ng screen, pag hindi, dito lang for no30w
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
