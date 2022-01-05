import 'dart:convert';
import 'package:http/http.dart' as http;

// taena ampanget 'di ko alam kung anong tamang implementation
// nakaka-return ng tamang data, hindi nga lang maganda for documentation

requestPasabayPostByID(int postID) async {
  final response = await http.post(
    // ? Look for the pasabay post with this ID
    // TODO: Look for the pasabay post with this ID
    // Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Login/get_user_by_email'),
    Uri.parse('https://jsonplaceholder.typicode.com/todos/$postID'),
    body: {'post_id': postID},
  );

//conditions for status codes
    print('From API');
  if (response.statusCode == 200) {
    // ? Pag return n'ya, ang ibibigay sakin ay yung whole post table
    print(json.decode(response.body));
    return json.decode(response.body);
  }

    //   !! PANGIT PA EXCEPTION HANDLING
  else if (response.statusCode == 404) {
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    // ! notFound();
    // TODO callback, pero gagamitin na natin ay state para sa ibang widgets
    throw Exception('Failed to login user: User does not exist.');
  } else if (response.statusCode == 401) {
    //Lalagay dito yung callback function na mag-wawarning na hindi pa created si user
    // wrongPass();
    throw Exception('Failed to login user: Wrong password.');
  } else {
    // If the server dfirstName not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to login user.');
  }

}

// implement Pahiram

// Data Type References
// Future submitVerificationCode(String username_email, String verification_code) async {
// 	Map data = {"username_email": username_email, "verification_code": verification_code};
// 	String jsonData = jsonEncode(data);
// 	String url = "http://localhost:8000/forgot-password/code";
// 	Response response = await post(url, body: jsonData);
// 	Map convertedData = jsonDecode(response.body);
// 	return convertedData;
// }
