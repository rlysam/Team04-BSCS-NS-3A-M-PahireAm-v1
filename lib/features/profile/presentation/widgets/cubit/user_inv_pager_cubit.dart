import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// NOTE No State needed

class InventoryPagerCubit extends Cubit<int> {
  InventoryPagerCubit() : super(1); //Page 1 muna

  void nextPage() => emit(state + 1);
  void prevPage() {
    if (state <= 1) {
      emit(1);
    } else {
      emit(state - 1);
    }
  }
}