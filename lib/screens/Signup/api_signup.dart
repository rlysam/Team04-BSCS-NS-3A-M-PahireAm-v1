// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'user.dart';

getCode(String email, String tupID, Function userFound) async {
  final response = await http.post(
    Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Register/verify_user'),
    body: {'email': email, 'tup_id': tupID},
  );
  if (response.statusCode == 200) {
    // If the server dfirstName return a 201 CREATED response,
    // then parse the JSON.
    return (json.decode(response.body));
  } else if (response.statusCode == 409) {
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    userFound();
    throw Exception('User Already Exist');
  } else {
    // If the server dfirstName not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed');
  }
}

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
  } else if (response.statusCode == 404) {
    //! not found
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 403) {
    //! already exists
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    throw Exception('Failed to login user: Wrong password.');
  } else {
    // If the server dfirstName not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}
