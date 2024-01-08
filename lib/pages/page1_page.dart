import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';
import 'package:states_app/services/user_services.dart';

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
      ),
      body: StreamBuilder<User>(
          stream: userService.userStream,
          builder: (context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? UserInfo(user: snapshot.data!)
                : const Center(child: Text('No hay información del user'));
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.user,
  });

  final User user;

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
              'Profesiones:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            for (String prof in user.profesions) ListTile(title: Text(prof)),
          ],
        ));
  }
}
