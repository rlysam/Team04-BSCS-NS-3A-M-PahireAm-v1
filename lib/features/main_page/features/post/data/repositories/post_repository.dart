// TODO Request Individual Post

import 'dart:math';

import 'package:pahiream_frontend/features/main_page/features/post/data/datasources/post_api.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/post.dart';

abstract class PostRepository {
  Future<Post> fetchPasabayPost();
  Future<Post> fetchPahiramPost();
}

class RealPostRepository implements PostRepository {

  @override
  Future<Post> fetchPahiramPost() {
    // TODO: implement fetchPahiramPost
    throw UnimplementedError();
  }

// TODO implement pagination

  @override
  Future<Post> fetchPasabayPost() async {
    //   final source = await requestPasabayPostByID();
    // return Future.delayed(
    //   Duration(seconds: 1), () => Post.fromMap(source));
    // TODO: implement fetchPasabayPost
    throw UnimplementedError();
      }
    // throw UnimplementedError();
  }


class NetworkException implements Exception {}
