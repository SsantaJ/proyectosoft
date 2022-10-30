import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyectosoft/vistas/Payment.dart';
import 'package:proyectosoft/vistas/SignIn.dart';
import 'package:proyectosoft/widgets/cart_card.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

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
              Row(children: [
                SizedBox(
                  width: screenwidth * 0.08,
                ),
                Custombotontxt(
                    funcion: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignIn();
                          },
                        ),
                      );
                    },
                    color: Color.fromARGB(0, 255, 255, 255),
                    text: "<",
                    color2: Colors.white,
                    x: screenwidth * 0.11,
                    y: screenheight * 0.055,
                    border: 50,
                    tamtxt: 30),
                SizedBox(
                  width: screenwidth * 0.1,
                ),
                const CustomText(
                  text: "Carrito de comida",
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ]),
              SizedBox(
                height: screenheight * 0.04,
              ),
              //CAMBIAR EN CART_CARD LOS PLACEHOLDERS, Y TEXTO DE PRECIO QUE ESTA EN BOLD
              cart_card(screenheight: screenheight, screenwidth: screenwidth),
              SizedBox(
                height: screenheight * 0.04,
              ),
              cart_card(screenheight: screenheight, screenwidth: screenwidth),
              SizedBox(
                height: screenheight * 0.04,
              ),
              cart_card(screenheight: screenheight, screenwidth: screenwidth),
              Flexible(child: Container()),
              Custombotontxt(
                  funcion: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Payment();
                        },
                      ),
                    );
                  },
                  color: Color(0xFFEBA503),
                  text: "Enviar",
                  color2: Colors.white,
                  x: screenwidth * 0.8,
                  y: screenheight * 0.06,
                  border: 50,
                  tamtxt: 20),
              SizedBox(
                height: screenheight * 0.04,
              ),
            ],
          )),
    ));
  }
}
