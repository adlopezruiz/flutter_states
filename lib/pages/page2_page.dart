import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states_app/controllers/user_controller.dart';
import 'package:states_app/models/user.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.isDarkMode ? 'Dark Theme' : 'Light Theme',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        // title: const Text(
        //   'Página 2',
        //   style: TextStyle(color: Colors.white),
        // ),
        backgroundColor: Colors.blue,
        elevation: 5,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userController.loadUser(User(
                    nombre: 'Adri', edad: 28, profesions: ['Profesion 1']));
                Get.snackbar('Carga de usuario', 'Usuario cargado con exito!',
                    backgroundColor: Colors.white,
                    boxShadows: [
                      const BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 10,
                        blurRadius: 10,
                      ),
                    ]);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => userController.changeAge(30),
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => userController.addProfession(
                  'Profesion ${userController.professionsCount + 1}'),
              child: const Text(
                'Añadir profesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                Get.changeThemeMode(ThemeMode.dark);
              },
              child: const Text(
                'Cambiar tema',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
