import 'package:bloc/bloc.dart';

class SwitchButtonCubit extends Cubit<bool> {
  SwitchButtonCubit() : super(true);
  void changeValue(bool value) => emit(!value);
}
