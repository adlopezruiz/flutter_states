import 'package:states_app/models/user.dart';

class UserService {
  User? _user;

  User get user => _user;

  bool get userExists => _user != null;
}
