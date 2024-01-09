import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_app/bloc/cubit/user_cubit.dart';
import 'package:states_app/models/user.dart';

class Pag1Page extends StatelessWidget {
  const Pag1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página 1',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => context.read<UserCubit>().deleteUser(),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        print(state);

        switch (state.runtimeType) {
          case UserInitial:
            return const Center(
              child: Text('No hay información del user'),
            );

          case UserActive:
            return UserInfo(user: (state as UserActive).user);

          default:
            return const Center(
              child: Text('Estado incorrecto'),
            );
        }
      },
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'General',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            ListTile(title: Text('Nombre: ${user.nombre}')),
            ListTile(title: Text('Edad: ${user.edad}')),
            const Text(
              'Profesiones',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...user.profesions
                .map((e) => ListTile(
                      title: Text(e),
                    ))
                .toList(),
          ],
        ));
  }
}
