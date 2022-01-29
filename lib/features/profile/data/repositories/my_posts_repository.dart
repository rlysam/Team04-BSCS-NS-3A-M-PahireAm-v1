
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:pahiream_frontend/features/login/data/models/user.dart';


deletePostById(String postID) async {
  final response = await http.post(
    Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Pasabay_post/deactivate_post'),
    // String to
    body: {'post_id' : postID},
  );
  if (response.statusCode == 200) {
      print('Succ');
    // return User.fromJson(json.decode(response.body));
  } 
//   else if (response.statusCode == 404) {
//     //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
//     notFound();
//     throw Exception('Failed to login user: User does not exist.');
//   } else if (response.statusCode == 401) {
//     //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
//     wrongPass();
//     throw Exception('Failed to login user: Wrong password.');
//   }
   else {
    // If the server dfirstName not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to Delete post');
  }
}
