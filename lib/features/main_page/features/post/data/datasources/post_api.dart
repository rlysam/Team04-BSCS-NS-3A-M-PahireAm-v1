import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> requestPahiramPostByID(int postID) async {
  final url = 'http://localhost/Team04-BSCS-NS-3A-M/Pahiram_post/get_post/?page=${postID.toString()}';
  final response = await http.get(Uri.parse(url));
  // conditions for status codes
  return json.decode(response.body);
}

Future<Map<String, dynamic>> requestPasabayPostByID(int postID) async {
  final url = 'http://localhost/Team04-BSCS-NS-3A-M/Pasabay_post/get_post/?page=${postID.toString()}';
  final response = await http.get(Uri.parse(url));
  // conditions for status codes
  return json.decode(response.body);
}
