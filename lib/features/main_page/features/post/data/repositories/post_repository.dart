
import 'package:pahiream_frontend/features/main_page/features/post/data/models/pahiram.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/pasabay.dart';

abstract class PostRepository {
    Future<Pasabay> fetchPasabayPost(
       // ? ano babato mo para sa get
       // ? ano sa response
       // ? ano sa ano sa body
       // ! for testing purposes, gawin muna natin by the post_id
       // ! SIMILAR TO WEATHER APP
       int postID
    );
    Future<Pahiram> fetchPahiramPost();
}

class RealPostRepository implements PostRepository {
  @override
  Future<Pasabay> fetchPasabay() {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          //Basta meron lang dito na TRUE || FALSE
          throw NetworkException();
        }

        // Return "fetched" weather
        return Weather(
          cityName: cityName,
          // Temperature between 20 and 35.99
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }
  Future<Pahiram> fetchPahiram(){

  }

}

class NetworkException implements Exception {}
