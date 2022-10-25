import 'dart:html';
import 'package:proyectosoft/widgets/funciones.dart';
import 'package:flutter/material.dart';

class SignUP extends StatelessWidget {
  const SignUP({Key? key}) : super(key: key);

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
          Container(
            decoration: BoxDecoration(),
            child: txt("Registrate", Colors.white, 20, "Poppins"),
            alignment: Alignment(-0.7, -0.1), //no sirve el height
          ),
          SizedBox(
            height: (screenheight * 0.06),
          ),
          campo("Correo electronico", false, Colors.white, screenwidth * 0.9,
              screenheight * 0.05),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          campo("Usuario", false, Colors.white, screenwidth * 0.9,
              screenheight * 0.05),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          campo("Contraseña", true, Colors.white, screenwidth * 0.9,
              screenheight * 0.05),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          campo("Repita su contraseña", true, Colors.white, screenwidth * 0.9,
              screenheight * 0.05),
          SizedBox(
            height: (screenheight * 0.04),
          ),
          boton(() {}, Color.fromARGB(255, 235, 165, 3), "Iniciar Sesion",
              Colors.white, screenwidth * 0.9, screenheight * 0.05),
          Container(
            width: screenwidth,
            height: screenheight * 0.468,
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              fit: BoxFit.cover,
              "assets/imgs/platofondo.png",
              height: screenheight * 0.45,
              scale: 0.1,
            ),
          ),
        ]),
      ),
    ));
  }
}
