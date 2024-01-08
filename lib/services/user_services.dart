import 'dart:async';

import 'package:states_app/models/user.dart';

class _UserService {
  User? _user;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  Stream<User> get userStream => _userStreamController.stream;
  User get user => _user!;
  bool get userExists => _user != null;

  void loadUser(User userInput) {
    _user = userInput;
    _userStreamController.add(userInput);
  }

  void changeAge(int edad) {
    _user!.edad = edad;
    _userStreamController.add(_user!);
  }

  dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
