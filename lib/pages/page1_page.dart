import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:states_app/controllers/user_controller.dart';
import 'package:states_app/models/user.dart';

class Pag1Page extends StatelessWidget {
  const Pag1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
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
      body: Obx(() => userController.existsUser.value
          ? UserInfo(user: userController.user.value)
          : const NoInfo()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.next_plan),
        onPressed: () => Get.toNamed('page2', arguments: {
          'nombre': 'Adri',
          'edad': 28,
        }),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay plata'),
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
            ...user.profesions!.map((e) => ListTile(
                  title: Text(e),
                )),
          ],
        ));
  }
}
