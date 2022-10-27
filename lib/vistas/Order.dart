import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyectosoft/widgets/funciones.dart';

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
                boton(() {}, Color.fromARGB(0, 255, 255, 255), "<",
                    Colors.white, screenwidth * 0.11, screenheight * 0.055, 30),
                SizedBox(
                  width: screenwidth * 0.1,
                ),
                txt("Carrito de comida", Colors.white, 20, "Poppins")
              ]),
              SizedBox(
                height: screenheight * 0.1,
              ),
              Container(
                height: screenheight*0.11,
                width: screenwidth*0.8,
                alignment: Alignment.center,
                child: Row(
                children: [
                  SizedBox(
                    width: screenwidth * 0.20,
                    child: Image.asset(
                      "assets/imgs/placeholder-carrito.png",
                    ),
                  ),
                  SizedBox(
                      width: screenwidth*0.06,
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      txt("Comida muy rica", Colors.white, 14, "Poppins"),
                      Flexible(child: Container()),
                      txt("\$99.99", Colors.green, 12, "Poppins"),
                      Flexible(child: Container())
                    ],
                  )
                ],
              ),
              ),
              
            ],
          )),
    ));
  }
}
