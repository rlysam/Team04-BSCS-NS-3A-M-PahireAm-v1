import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pahiram_state.dart';

class PahiramCubit extends Cubit<PahiramState> {
  PahiramCubit() : super(PahiramInitial());
}
