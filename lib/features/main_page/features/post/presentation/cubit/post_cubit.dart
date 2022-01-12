// TODO Cubit Individual post

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/post.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/repositories/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {

  final PostRepository _postRepository;

  PostCubit(this._postRepository) : super(const PostInitial());

  Future<void> getPahiram(int id) async{
      try {
          emit(const PostLoading());
          final pahiram = await _postRepository.fetchPahiramPost();
          emit(PostLoaded(pahiram));
      } on NetworkException {
          emit(const PostError("Walang internet!"));
      }
  }

  Future<void> getPasabay(int id) async{
      try {
          emit(const PostLoading());
          final pasabay = await _postRepository.fetchPasabayPost();
          emit(PostLoaded(pasabay));
      } on NetworkException {
          emit(const PostError("Walang internet!"));
      }
  }

}
