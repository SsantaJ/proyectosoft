import 'dart:html';
import 'package:proyectosoft/widgets/funciones.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: Container(
        width: screenwidth,
        height: screenheight,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 75, 109, 184),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ));
  }
}
