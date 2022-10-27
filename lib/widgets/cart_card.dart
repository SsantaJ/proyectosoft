import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/funciones.dart';


class cart_card extends StatefulWidget {
  cart_card({
    Key? key,
    required this.screenheight,
    required this.screenwidth,
  }) : super(key: key);

  final double screenheight, screenwidth;
  @override
  State<cart_card> createState() => _cart_cardState();
}

class _cart_cardState extends State<cart_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
                height: widget.screenheight*0.11,
                width: widget.screenwidth*0.86,
                alignment: Alignment.center,
                child: Row(
                children: [
                  SizedBox(
                    width: widget.screenwidth *0.24,
                    child: Image.asset(
                      "assets/imgs/placeholder-carrito.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                      width: widget.screenwidth*0.04,
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                      height: widget.screenheight*0.02,
                    ),
                      txt("Comida muy rica", Colors.white, 14, "Poppins"),
                      Flexible(child: Container()),
                      txt("\$99.99", Colors.green, 12, "Poppins"),
                      Flexible(child: Container())
                    ],
                  ),
                  Flexible(child: Container()),
                  GestureDetector(
                    onTap: (){},
                    child:
                  Image.asset("assets/imgs/trash-can.png") ,
                  )
                ],
              ),
              );
  }
}