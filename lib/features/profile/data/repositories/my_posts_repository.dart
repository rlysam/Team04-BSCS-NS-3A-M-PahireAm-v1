// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

deletePostByIdPasabay(String postID) async {
  final response = await http.post(
    Uri.parse(
        'http://localhost/Team04-BSCS-NS-3A-M/Pasabay_post/deactivate_post'),
    // String to
    body: {'post_id': postID},
  );
  if (response.statusCode == 200) {
    print('Succ');
    // return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to Delete post');
  }
}

deletePostByIdPahiram(String postID) async {
  final response = await http.post(
    Uri.parse(
        'http://localhost/Team04-BSCS-NS-3A-M/Pahiram_post/deactivate_post'),
    // String 'to
    body: {'post_id': postID},
  );
  if (response.statusCode == 200) {
    print('Succ');
  } else {
    throw Exception('Failed to Delete post');
  }
}
