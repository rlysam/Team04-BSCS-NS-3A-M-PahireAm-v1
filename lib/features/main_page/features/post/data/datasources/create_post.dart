
// TODO: Wag muna gawing separate yung pag access ng file from repository, 'di ko ma gets eh
// TODO: Write everything on REPOSITORY Class


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:pahiream_frontend/features/main_page/features/post/data/models/post.dart';

// import 'package:pahiream_frontend/features/login/data/models/user.dart';


createPost(
    String? title,
    String? type,
    String? location,
    String? destination,
    String? quantity,
    String? rate,
    String? image_location,
) async {
String datetime = DateTime.now().toString();
  final response = await http.post(
    // Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Register/insert_user'),
    //yung function na hahanapin si x user using email and pass
    Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Login/get_user_by_email'),
    body: 
    {
      'user_id': "100", // Laging 1
      
      'first_name': "Seller Fname",
      'last_name': "Seller Lname",

      'points': "2",
      'time_posted': datetime,
      'date': datetime,

      'status': 'Active',

      'title': title,
      'type': type, //Pahiram Pasabay

      'location': location,
      'destination': destination,
      'quantity': quantity,

      'rate': rate,
      'image_location': image_location,
    }
  );

//   if (response.statusCode == 200) {
//     // If the server dfirstName return a 201 CREATED response,
//     // then parse the JSON.
//     // TODO  +=== ito yung kailangan isulat sa API return User.fromJson(json.decode(response.body));
//     return User.fromJson(json.decode(response.body));
//   } else if (response.statusCode == 404) {
//     //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
//     notFound();
//     throw Exception('Failed to login user: User does not exist.');
//   } else if (response.statusCode == 401) {
//     //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
//     wrongPass();
//     throw Exception('Failed to login user: Wrong password.');
//   } else {
//     // If the server dfirstName not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to login user.');
//   }
}