import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_button_state.dart';

class SwitchButtonCubit extends Cubit<SwitchButtonState> {
  SwitchButtonCubit() : super(SwitchButtonInitial());
}
