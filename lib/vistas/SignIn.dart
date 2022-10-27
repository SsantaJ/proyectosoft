// ignore_for_file: file_names
import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/vistas/welcomePage.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
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
      width: screenwidth,
      height: screenheight,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 75, 109, 184),
      ),
      child: Column(children: [
        SizedBox(
          height: (screenheight * 0.06),
        ),
        Align(
          alignment: const Alignment(-0.88, 0),
          child: boton(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WelcomePage();
                },
              ),
            );
          }, Color.fromARGB(0, 255, 255, 255), "<", Colors.white,
              screenwidth * 0.11, screenheight * 0.055, 30),
        ),
        SizedBox(
          height: (screenheight * 0.02),
        ),
        Container(
          decoration: const BoxDecoration(),
          child: txt("Ingresar", Colors.white, 20, "Poppins"),
          alignment: const Alignment(-0.85, -0.1), //no sirve el height
        ),
        SizedBox(
          height: (screenheight * 0.045),
        ),
        CustomTextField(
            obs: false,
            text: "Usuario",
            x: screenwidth * 0.9,
            y: screenheight * 0.07,
            color: Colors.white),
        SizedBox(
          height: (screenheight * 0.02),
        ),
        CustomTextField(
            obs: true,
            text: "Contraseña",
            x: screenwidth * 0.9,
            y: screenheight * 0.07,
            color: Colors.white),
        SizedBox(
          height: (screenheight * 0.04),
        ),
        boton(() {
          Navigator.push(context, MaterialPageRoute(builder: (context){ return Order();}));
        }, const Color.fromARGB(255, 235, 165, 3), "Iniciar Sesion",
            Colors.white, screenwidth * 0.9, screenheight * 0.075, 20),
        Flexible(
          child: Container(),
        ),
        Align(
          alignment: const Alignment(-1, 1),
          child: Image.asset(
            fit: BoxFit.cover,
            "assets/imgs/platofondo.png",
            height: screenheight * 0.35,
            scale: 0.1,
          ),
        ),
      ]),
    ));
  }
}
