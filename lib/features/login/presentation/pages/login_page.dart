import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/login/data/datasources/api_login.dart';

import 'package:pahiream_frontend/features/login/data/models/user.dart';
// import 'package:pahiream_frontend/features/signup/data/models/user.dart';
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
	void dispose() {
		super.dispose();
		_ctrlUserEmail.dispose();
		_ctrlUserPass.dispose();
	}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                    style:
                        CommonStyleText.txtStyle(size: pToF(64), weigth: bold),
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
                    obscureText: true,
                    controller: _ctrlUserPass,
                    decoration: CommonStyleInput.textFieldStyle(
                        isCorrect: correctPassword, hasIcon: true),
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
                    height: pToF(20),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //pag correct, lilipat ng screen, pag hindi, dito lang for now
                        _futureUser = fetchUser(_ctrlUserEmail.text,
                            _ctrlUserPass.text, wrongPass, notFound);
                        
                        if (_futureUser!=null) {
                            // ! lagay sa Cubit yung future User
                            _futureUser?.then((value) {
                            //   value.
                              
                            });

                            // TODO gawin lagay sa argument yung user details
                            Navigator.of(context).pushNamed('/landingPage');

                        } else {
                        }
                      },
                      child: Text(
                        'Login',
                        style: CommonStyleText.txtStyle(
                            size: pToF(24), color: kWhite, weigth: medium),
                      ),
                      style: CommonStyleButton.btnStyle(),
                    ),
                  ),
                  SizedBox(height: pToF(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No account yet?',
                          style: CommonStyleText.txtStyle()),
                      SizedBox(width: pToF(0)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signUpPage');
                          },
                          child: Text(
                            'Register',
                            style:
                                CommonStyleText.txtStyle(color: kPrimaryGreen),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: kPrimaryGreen,
          //         image: const DecorationImage(
          //             fit: BoxFit.contain,
          //             image: NetworkImage('https://i.imgur.com/ioLKZiy.png'))),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
