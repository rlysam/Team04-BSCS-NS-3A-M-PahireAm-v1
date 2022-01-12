import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// NOTE No State needed

class PagerCubit extends Cubit<int> {
  PagerCubit() : super(1); //Page 1 muna 

  void nextPage() => emit(state + 1);
  void prevPage() => emit(state - 1);
}
