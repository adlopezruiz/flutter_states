import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/user/user_bloc.dart';
import 'package:states_app/models/user.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página 2',
          style: TextStyle(color: Colors.white),
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
                userBloc.add(ActivateUserEvent(User(
                    nombre: 'Adri', edad: 28, profesions: ['Profesion 1'])));
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAgeEvent(newAge: 35));
              },
              child: const Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => userBloc.add(AddProfessionEvent()),
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
