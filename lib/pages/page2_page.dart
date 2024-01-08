import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';
import 'package:states_app/services/user_service.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userService.userExists ? userService.user.nombre : 'No hay plata',
          style: const TextStyle(color: Colors.white),
        ),
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
                final newUser = User(
                  edad: 25,
                  nombre: 'Adri',
                  profesions: ['praticante', 'dev', 'popasodpasd'],
                );

                userService.user = newUser;
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => userService.changeAge(35),
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => userService.addProf(),
              child: const Text(
                'Añadir profesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
