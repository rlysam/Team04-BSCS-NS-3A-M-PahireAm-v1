import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/posts_data.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/repositories/post_posts_repository.dart';

part 'pahiram_posts_state.dart';

class PahiramPostsCubit extends Cubit<PahiramPostsState> {
  final WeatherRepository _bulkdataRepository;

  PahiramPostsCubit(this._bulkdataRepository) : super(const PahiramPostsInitial());

  Future<void> get10PostsPahiram(int pageNumber) async {
    try {
      emit(const PahiramPostsLoading());
      final bulkData = await _bulkdataRepository.fetchBulkPostPahiram(pageNumber);
      emit(PahiramPostsLoaded(bulkData));
    } on NetworkException {
      emit(const PahiramPostsError("Couldn't fetch weather. Is the device online?"));
    }
  }
}

