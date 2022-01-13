import 'dart:math';

import 'package:pahiream_frontend/features/main_page/features/post/data/datasources/batch_posts_api.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/posts_data.dart';


abstract class WeatherRepository {
  /// Throws [NetworkException].
//   Future<Post> fetchWeather(int postID);
  Future<PostsData> fetchBulkPostPahiram(int pageNumber);
  Future<PostsData> fetchBulkPostPasabay(int pageNumber);
//   Future<PostsData> fetchBulkPost(int pageNumber);
//   ! Note: yung function definition lang sa repository
}

class FakeWeatherRepository implements WeatherRepository {

// TODO For single request
//   @override
//   Future<Post> fetchWeather(int postID) async {
//     final source = await requestPasabayPostByID(postID);
//     return Future.delayed(Duration(seconds: 0), () => Post.fromMap(source));
//   }

  @override
  Future<PostsData> fetchBulkPostPahiram(int pageNumber) async {
    final source = await requestPahiramPostByID(pageNumber);
    return Future.delayed(Duration(milliseconds: 300), () => PostsData.fromMap(source));
  }

  @override
  Future<PostsData> fetchBulkPostPasabay(int pageNumber) async {
    final source = await requestPasabayPostByID(pageNumber);
    return Future.delayed(const Duration(milliseconds: 300), () => PostsData.fromMap(source));
  }

}

class NetworkException implements Exception {}
