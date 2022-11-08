import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/vistas/welcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDiOb5Gj7yNN7qEZbtmDvNrvNVkglqf8a8",
      appId: "1087592743276:android:17b88d71bfc6662043b349",
      messagingSenderId: "1087592743276",
      projectId: "mmfood-810d9",
    ),
  );
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
          body: WelcomePage(),
        ));
  }
}
