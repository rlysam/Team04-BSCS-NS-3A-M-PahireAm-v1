import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/posts_data.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/repositories/post_posts_repository.dart';

part 'pasabay_posts_state.dart';

class PasabayPostsCubit extends Cubit<PasabayPostsState> {
  final WeatherRepository _bulkdataRepository;

  PasabayPostsCubit(this._bulkdataRepository) : super(PasabayPostsInitial());

  Future<void> get10PostsPasabay(int pageNumber) async {
    try {
      emit(const PasabayPostsLoading());
      final bulkData = await _bulkdataRepository.fetchBulkPostPasabay(pageNumber);
      emit(PasabayPostsLoaded(bulkData));
    } on NetworkException {
      emit(const PasabayPostsError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
