import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:states_app/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    //Recoger nuevo usuario del evento y emitir nuevo estado con el usuario seteado
    on<ActivateUserEvent>((event, emit) => emit(UserSetState(event.user)));

    //Trigger al recibir cambio edad
    on<ChangeUserAgeEvent>(
      (event, emit) {
        print('Change age called');
        if (!state.existsUser) return;
        emit(UserSetState(state.user!.copyWith(edad: event.newAge)));
      },
    );

    //Add proffesion
    on<AddProfessionEvent>(
      (event, emit) {
        if (!state.existsUser) return;
        final userProfessions = [
          ...state.user!.profesions,
          'Profesión ${state.user!.profesions.length + 1}'
        ];

        emit(UserSetState(state.user!.copyWith(profesions: userProfessions)));
      },
    );

    on<RemoveUserEvent>(
      (event, emit) => emit(const UserInitialState()),
    );
  }
}
