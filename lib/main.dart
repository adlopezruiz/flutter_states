import 'package:flutter/material.dart';
import 'package:states_app/pages/page1_page.dart';
import 'package:states_app/pages/page2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (_) => Pag1Page(),
        'page2': (_) => Page2Page(),
      },
    );
  }
}
