import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:states_app/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void selectUser(User user) {
    emit(UserActive(user: user));
  }

  void changeAge(int newAge) {
    final currentState = state;

    if (currentState is UserActive) {
      emit(UserActive(user: currentState.user.copyWith(edad: newAge)));
    }
  }

  void addProfession() {
    final currentState = state;

    if (currentState is UserActive) {
      final profList = [
        ...currentState.user.profesions,
        'Profesión ${currentState.user.profesions.length + 1}'
      ]; //Spread operator "spreads" one array into another

      emit(UserActive(user: currentState.user.copyWith(profesions: profList)));
    }
  }

  void deleteUser() {
    emit(UserInitial());
  }
}
