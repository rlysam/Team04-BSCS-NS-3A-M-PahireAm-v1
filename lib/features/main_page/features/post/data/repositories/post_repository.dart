import 'dart:math';

import 'package:pahiream_frontend/features/main_page/features/post/data/datasources/post_api.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/pahiram.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/pasabay.dart';

abstract class PostRepository {
  Future<Pasabay> fetchPasabayPost(
      // ? ano babato mo para sa get
      // ? ano sa response
      // ? ano sa ano sa body
      // ! for testing purposes, gawin muna natin by the post_id
      // ! SIMILAR TO WEATHER APP
      // TODO:   DITO ATA Pwedeng ilagay kung anong page na...
      int postID);
  Future<Pahiram> fetchPahiramPost();
}

class RealPostRepository implements PostRepository {
  @override
  Future<Pasabay> fetchPasabayPost(int postID) async {
    // final random = Random();
    // ! Tama ba yun may await dito? or dun nalang sa pag gamit ng http sa API Class
    // ganito dapat
    final String source = await requestPasabayPostByID(postID); //defined in
    // final Map<dynamic,dynamic> source = await requestPasabayPostByID(postID); //defined in
    // TODO ang ilalalgay dito dapat ay galing sa api response

// debug
    print('From Repository');
    print(Pasabay.fromJson(source));
    print(Pasabay.fromJson(source).runtimeType);

    return Pasabay.fromJson(source);
  }

  @override
  Future<Pahiram> fetchPahiramPost() {
    // TODO: implement fetchPahiramPost
    throw UnimplementedError();
  }
}

class NetworkException implements Exception {}
