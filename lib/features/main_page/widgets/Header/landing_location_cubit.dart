import 'package:bloc/bloc.dart';

class LandingLocationCubit extends Cubit<bool> {
  LandingLocationCubit() : super(true);
  void goToMain() => emit(true);
  void goToUserProfile() => emit(false);
}