import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyectosoft/vistas/SignIn.dart';
import 'package:proyectosoft/widgets/cart_card.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
import 'package:proyectosoft/widgets/funciones.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: Container(
          width: screenwidth,
          height: screenheight,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 75, 109, 184),
          ),
          child: Column(
            children: [
              SizedBox(
                height: (screenheight * 0.06),
              ),

              SizedBox(
                width: screenwidth * 0.08,
              ),
              SizedBox(
                width: screenwidth * 0.1,
              ),
              CustomTextField(
                  obs: false,
                  text: "Busca tu plato",
                  x: screenwidth * 0.9,
                  y: screenheight * 0.07,
                  color: Colors.white),
              SizedBox(
                height: (screenheight * 0.02),
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),

              Row(
                children: [
                  Flexible(
                    child: Container(),
                  ),
                  SizedBox(
                    height: screenheight * 0.1,
                    width: screenwidth * 0.2,
                    child: boton(() {}, Colors.white, "aaa", Colors.amber,
                        screenheight * 0.1, screenwidth * 0.2, 10, 10),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  SizedBox(
                    height: screenheight * 0.1,
                    width: screenwidth * 0.2,
                    child: boton(() {}, Color(0xffEBA503), "aaa", Colors.white,
                        screenheight * 0.1, screenwidth * 0.2, 10, 10),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  SizedBox(
                    height: screenheight * 0.1,
                    width: screenwidth * 0.2,
                    child: boton(() {}, Colors.white, "aaa", Colors.amber,
                        screenheight * 0.1, screenwidth * 0.2, 10, 10),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                ],
              ),
              txt("text", colr, tam, estilo))

              //CAMBIAR EN CART_CARD LOS PLACEHOLDERS, Y TEXTO DE PRECIO QUE ESTA EN BOLD
              /* cart_card(screenheight: screenheight, screenwidth: screenwidth),
              SizedBox(
                height: screenheight * 0.04,
              ),
              cart_card(screenheight: screenheight, screenwidth: screenwidth),
              SizedBox(
                height: screenheight * 0.04,
              ),
              cart_card(screenheight: screenheight, screenwidth: screenwidth),
              Flexible(child: Container()),
              boton(() {}, Color(0xFFEBA503), "Enviar", Colors.white,
                  screenwidth * 0.8, screenheight * 0.06, 20),
              SizedBox(
                height: screenheight * 0.04,
              ), */
            ],
          )),
    ));
  }
}
