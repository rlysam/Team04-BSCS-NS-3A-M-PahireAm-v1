import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pasabay_state.dart';

class PasabayCubit extends Cubit<PasabayState> {
  PasabayCubit() : super(PasabayInitial());
}
