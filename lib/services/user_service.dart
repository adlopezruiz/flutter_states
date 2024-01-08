import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User get user => _user!;
  bool get userExists => _user != null;

  set user(User userInput) {
    _user = userInput;
    notifyListeners();
  }

  void changeAge(int newAge) {
    _user!.edad = newAge;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProf() {
    _user!.profesions.add('Nueva profesion');
    notifyListeners();
  }
}
