import 'package:flutter/material.dart';
import 'package:proyectosoft/vistas/signIn.dart';
import 'package:proyectosoft/vistas/signUp.dart';
import 'package:proyectosoft/vistas/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'mmmFOOD',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Scaffold(
          backgroundColor: Color(0xFFBFD6D9),
          body: const WelcomePage(),
        ));
  }
}
