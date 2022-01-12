import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'paged_main_content_state.dart';

class PagedMainContentCubit extends Cubit<PagedMainContentState> {
  PagedMainContentCubit() : super(PagedMainContentInitial());
}
