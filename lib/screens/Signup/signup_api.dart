// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'user.dart';

Future<User> createUser(
  String firstName,
  String lastName,
  String tupID,
  String email,
  String password,
) async {
  final response = await http.post(
    Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Register/insert_user'),
    //REMOVED HEADERS NAG KAKAROON NG BAD STATE: cannot set the body fields of Request password with content-password "text/html"
    //LALAGYAN LANG ATA NG HEADER PAG RESPONSE
    body: {
      //TINANGGAL KO YUNG JSON
      'first_name': firstName,
      'last_name': lastName,
      'tup_id': tupID,
      'email': email,
      'password': password,
      // 'status': status,
      // 'tup_firstName': tupfirstName,
      // 'image_location': imgloc,
    },
  );

  if (response.statusCode == 201) {
    // If the server dfirstName return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If the server dfirstName not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
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
//             Text(snapshot.data!.tupID.toString()),
//             Text(snapshot.data!.email.toString()),
//             Text(snapshot.data!.password.toString()),
//             Text(snapshot.data!.status.toString()),
//             Text(snapshot.data!.tupfirstName.toString()),
//             Text(snapshot.data!.imgloc.toString()),
//             Text(snapshot.data!.imgloc.toString()),
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