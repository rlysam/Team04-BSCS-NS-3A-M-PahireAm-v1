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

  if (response.statusCode == 200) {
    // If the server dfirstName return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If the server dfirstName not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}
