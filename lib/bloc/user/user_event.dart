part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUserEvent extends UserEvent {
  final User user;
  ActivateUserEvent(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int newAge;

  ChangeUserAgeEvent({required this.newAge});
}

class AddProfessionEvent extends UserEvent {}

class RemoveUserEvent extends UserEvent {}
