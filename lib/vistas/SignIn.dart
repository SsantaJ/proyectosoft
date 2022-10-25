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
        body: Container(
      child: Container(
        width: screenwidth,
        height: screenheight,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 75, 109, 184),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(children: [
          SizedBox(
            height: (screenheight * 0.08),
          ),
          Spacer(flex: 1),
          Container(
            decoration: BoxDecoration(),
            child: txt("Ingresar", Colors.white, 12, "Poppins"),
            alignment: Alignment(-0.7, -0.1), //no sirve el height
          ),
          Container(
            width: screenwidth,
            height: screenheight * 0.875,
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              fit: BoxFit.cover,
              "assets/imgs/platofondo.png",
              height: screenheight * 0.45,
              scale: 0.1,
            ),
          )
        ]),
      ),
    ));
  }
}
