import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';
import 'package:states_app/services/user_services.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<User>(
            stream: userService.userStream,
            builder: (context, AsyncSnapshot<User> snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data?.nombre ?? '' : 'No hay data',
                style: const TextStyle(color: Colors.white),
              );
            }),
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
                  nombre: 'Adrian',
                  edad: 28,
                  profesions: ['Programador', 'Praticante', 'Pro player'],
                );
                userService.loadUser(newUser);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userService.changeAge(30);
              },
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {},
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
