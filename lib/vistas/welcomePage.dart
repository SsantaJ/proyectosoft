import 'package:proyectosoft/widgets/custom_txtField.dart';
import 'package:proyectosoft/widgets/funciones.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    Text prueba1 = txt("mm", Colors.white, 50, "Poppins");
    Text prueba2 = txt("food", Colors.white, 50, "Poppins");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 75, 109, 184),
      body: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          /* SizedBox(
            height: (screenheight * 0.1),
          ), */
          txt("mm", Colors.white, 50, "Poppins"),
          txt("food", Colors.white, 60, "Poppins"),
          Spacer(
            flex: 1,
          ),
          /* SizedBox(
            height: (screenheight * 0.1),
          ), */
          boton(() {}, Color.fromARGB(255, 235, 165, 3), "Inicia Sesión",
              Colors.white, screenwidth * 0.9, screenheight * 0.075),
          SizedBox(
            height: (screenheight * 0.05),
          ),
          boton(() {}, Color.fromARGB(255, 255, 118, 19), "Registrate",
              Colors.white, screenwidth * 0.9, screenheight * 0.075),
          Spacer(
            flex: 1,
          ),
          /* SizedBox(
            height: (screenheight * 0.01),
          ), */
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
