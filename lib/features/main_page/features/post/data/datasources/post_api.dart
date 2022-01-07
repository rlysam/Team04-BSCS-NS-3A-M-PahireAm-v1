import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> requestPahiramPostByID(int postID) async {
  final url = 'https://jsonplaceholder.typicode.com/photos/${postID.toString()}';
  final response = await http.get(Uri.parse(url));
  // conditions for status codes
  return json.decode(response.body);
}

Future<Map<String, dynamic>> requestPasabayPostByID(int postID) async {
  final url = 'https://jsonplaceholder.typicode.com/photos/${postID.toString()}';
  final response = await http.get(Uri.parse(url));
  // conditions for status codes
  return json.decode(response.body);
}
