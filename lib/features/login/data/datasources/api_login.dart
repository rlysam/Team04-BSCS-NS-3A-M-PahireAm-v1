// TODO: Wag muna gawing separate yung pag access ng file from repository, 'di ko ma gets eh
// TODO: Write everything on REPOSITORY Class


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:pahiream_frontend/features/login/data/models/user.dart';


Future<User> fetchUser(String email, String password, Function wrongPass,
    Function notFound) async {
  final response = await http.post(
    // Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Register/insert_user'),
    //yung function na hahanapin si x user using email and pass
    Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Login/get_user_by_email'),
    body: {'email': email, 'password': password},
  );
  if (response.statusCode == 200) {
    // If the server dfirstName return a 201 CREATED response,
    // then parse the JSON.
    // TODO  +=== ito yung kailangan isulat sa API return User.fromJson(json.decode(response.body));
    return User.fromJson(json.decode(response.body));
  } else if (response.statusCode == 404) {
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    notFound();
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    wrongPass();
    throw Exception('Failed to login user: Wrong password.');
  } else {
    // If the server dfirstName not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to login user.');
  }
}

// FutureBuilder<User> buildFutureBuilder(
//     Future<User> _futureUser, Function callback) {
//   return FutureBuilder<User>(
//     future: _futureUser,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         return Column(
//           children: [
//             Text(snapshot.data!.firstName.toString()),
//             Text(snapshot.data!.lastName.toString()),
//             ElevatedButton(
//               onPressed: () => callback(),
//               child: const Text('Balik'),
//             )
//           ],
//         );
//       } else if (snapshot.hasError) {
//         return Text('${snapshot.error}');
//       }
//       return const CircularProgressIndicator();
//     },
//   );
// }

// ! BUSINESS OWNER --- SAMPLE API
// import 'package:http/http.dart';
// import 'dart:convert';

// Future loginBusinessOwner(String username, String password) async {
// 	Map data = {"username": username, "password": password};
// 	String jsonData = jsonEncode(data);
// 	String url = "http://localhost:8000/login/business-owner";
// 	Response response = await post(url, body: jsonData);
// 	Map convertedData = jsonDecode(response.body);
// 	return convertedData;
// }

// Future forgotPassword(String username_email, String password) async {
// 	Map data = {"username_email": username_email, "password": password};
// 	String jsonData = jsonEncode(data);
// 	String url = "http://localhost:8000/forgot-password";
// 	Response response = await post(url, body: jsonData);
// 	Map convertedData = jsonDecode(response.body);
// 	return convertedData;
// }

// Future submitVerificationCode(String username_email, String verification_code) async {
// 	Map data = {"username_email": username_email, "verification_code": verification_code};
// 	String jsonData = jsonEncode(data);
// 	String url = "http://localhost:8000/forgot-password/code";
// 	Response response = await post(url, body: jsonData);
// 	Map convertedData = jsonDecode(response.body);
// 	return convertedData;
// }
