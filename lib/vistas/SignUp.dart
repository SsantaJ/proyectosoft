import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/vistas/welcomePage.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
import 'package:proyectosoft/widgets/funciones.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class SignUP extends StatelessWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 75, 109, 184),
      body: Column(
        children: [
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
                screenwidth * 0.11, screenheight * 0.055, 30, 50),
          ),
          SizedBox(
            height: (screenheight * 0.015),
          ),
          Container(
            decoration: const BoxDecoration(),
            child: const CustomText(
              text: "Registrate",
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Poppins",
            ),
            alignment: Alignment(-0.85, -0.1), //no sirve el height
          ),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: false,
              text: "Correo electronico",
              x: screenwidth * 0.9,
              y: screenheight * 0.07,
              color: Colors.white),
          SizedBox(
            height: (screenheight * 0.02),
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
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: true,
              text: "Repita su contraseña",
              x: screenwidth * 0.9,
              y: screenheight * 0.07,
              color: Colors.white),
          SizedBox(
            height: (screenheight * 0.03),
          ),
          boton(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Order();
                },
              ),
            );
          }, Color.fromARGB(255, 255, 118, 19), "Registrarse", Colors.white,
              screenwidth * 0.9, screenheight * 0.075, 20, 50),
          Flexible(
            child: Container(),
          ),
          Align(
            alignment: Alignment(-1, 1),
            child: Image.asset(
              fit: BoxFit.cover,
              "assets/imgs/platofondo.png",
              height: screenheight * 0.35,
              scale: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
