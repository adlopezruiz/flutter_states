import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/bloc/user/user_bloc.dart';
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
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false)
                    .add(RemoveUserEvent());
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existsUser
              ? UserInfo(user: state.user!)
              : const Center(child: Text('No hay plata'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

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
            ...user.profesions.map(
              (e) => ListTile(title: Text(e)),
            )
          ],
        ));
  }
}
