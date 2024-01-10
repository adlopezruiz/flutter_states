import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states_app/pages/page1_page.dart';
import 'package:states_app/pages/page2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'page1',
        getPages: [
          GetPage(name: '/page1', page: () => const Pag1Page()),
          GetPage(name: '/page2', page: () => const Page2Page()),
        ]);
  }
}
