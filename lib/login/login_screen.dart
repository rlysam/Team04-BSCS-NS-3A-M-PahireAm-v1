import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/constants.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String myImageUrl =
	  "https://static.wikia.nocookie.net/dota2_gamepedia/images/f/f4/Spell_Steal_icon.png/revision/latest/scale-to-width-down/128?cb=20120620034900";

  @override
  Widget build(BuildContext context) {
	final TextEditingController fname = new TextEditingController();
	final TextEditingController lname = new TextEditingController();
	final TextEditingController idnum = new TextEditingController();
	final TextEditingController email = new TextEditingController();
	final TextEditingController password = new TextEditingController();
	final TextEditingController passwordConfirm = new TextEditingController();

	Size size = MediaQuery.of(context).size;

	// Future<http.Response> createAlbum(String title) {
	//   return http.post(
	//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
	//     headers: <String, String>{
	//       'Content-Type': 'application/json; charset=UTF-8',
	//     },
	//     body: jsonEncode(<String, String>{
	//       'title': title,
	//     }),
	//   );
	// }

	postData() async {
	  try {
		var response = await http.post(
			Uri.parse(
				'http://localhost/Team04-BSCS-NS-3A-M/Register_Controller/send_email_verification'),
			body: {
				'id': DateTime.now().toString(),
				'fname': fname.text,
				'lname': lname.text,
				'email': fname.text,
				'password': password.text,
			});
			print(response.body);
	  } catch (e) {
		print(e);
	  }
	}

	InputDecoration mydecororation() {
	  return InputDecoration(
		  isDense: true,
		  contentPadding: EdgeInsets.fromLTRB(24, 15, 0, 14),
		  enabledBorder: OutlineInputBorder(
			  borderSide: const BorderSide(width: 1, color: Colors.black),
			  borderRadius: BorderRadius.circular(5)),
		  focusedBorder: OutlineInputBorder(
			  borderSide: const BorderSide(width: 1, color: Colors.green),
			  borderRadius: BorderRadius.circular(5)));
	}

	return Scaffold(
	  appBar: AppBar(title: const Text('Registration')),
	  body: Container(
		margin: EdgeInsets.symmetric(horizontal: 90),
		width: size.width / 2,
		height: size.height,
		child: ListView(
		  children: [
			Text(
			  'Create Account',
			  style: TextStyle(fontSize: pToF(48)),
			),
			SizedBox(height: pToF(20)),
			Row(
			  children: [
				Column(
				  children: [
					Text('First Name'.toUpperCase()),
					SizedBox(height: pToF(16)),
					SizedBox(
						height: 50,
						width: 200,
						child: TextFormField(
						  controller: fname,
						  decoration: mydecororation(),
						))
				  ],
				),
				SizedBox(width: 50),
				Column(
				  children: [
					Text('Last Name'.toUpperCase()),
					SizedBox(height: pToF(16)),
					SizedBox(
						height: 50,
						width: 200,
						child: TextFormField(
						  controller: lname,
						  decoration: mydecororation(),
						))
				  ],
				)
			  ],
			),
			SizedBox(height: pToF(20)),
			Row(
			  children: [
				Column(
				  children: [
					Text('TUD id number'.toUpperCase()),
					SizedBox(
					  height: pToF(16),
					),
					SizedBox(
						height: 50,
						width: 200,
						child: TextFormField(
						  controller: idnum,
						  decoration: mydecororation(),
						))
				  ],
				),
			  ],
			),
			SizedBox(height: pToF(20)),
			Row(
			  children: [
				Column(
				  children: [
					Text('Email'.toUpperCase()),
					SizedBox(
					  height: pToF(16),
					),
					SizedBox(
						height: 50,
						width: 200,
						child: TextFormField(
						  controller: email,
						  decoration: mydecororation(),
						))
				  ],
				),
			  ],
			),
			SizedBox(height: pToF(20)),
			Row(
			  children: [
				Column(
				  children: [
					Text('Password'.toUpperCase()),
					SizedBox(
					  height: pToF(16),
					),
					SizedBox(
						height: 50,
						width: 200,
						child: TextFormField(
						  controller: password,
						  decoration: mydecororation(),
						))
				  ],
				),
				SizedBox(width: 50),
				Column(
				  children: [
					Text('Confirm Password'.toUpperCase()),
					SizedBox(
					  height: pToF(16),
					),
					SizedBox(
						height: 50,
						width: 200,
						child: TextFormField(
						  controller: passwordConfirm,
						  decoration: mydecororation(),
						))
				  ],
				)
			  ],
			),
			SizedBox(height: pToF(20)),
			SizedBox(
			  width: 300,
			  child: ElevatedButton(
				  // style: ElevatedButton.styleFrom(maximumSize: Size(300, 50)),
				  onPressed: () => postData(),
				  child: const Text('REGISTER')),
			)
		  ],
		),
	  ),
	);
  }
}
