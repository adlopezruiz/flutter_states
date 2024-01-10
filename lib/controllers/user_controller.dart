import 'package:get/get.dart';
import 'package:states_app/models/user.dart';

class UserController extends GetxController {
  final RxBool existsUser = false.obs;
  final Rx<User> user = User().obs;

  get professionsCount => user.value.profesions!.length;

  void loadUser(User newUser) {
    user.value = newUser;
    existsUser.value = true;
  }

  void changeAge(int newAge) {
    user.update((val) {
      val!.edad = newAge;
    });
  }

  void addProfession(String profName) {
    user.update((val) {
      val!.profesions = [...val.profesions!, profName];
    });
  }
}
