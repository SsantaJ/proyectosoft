import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/widgets/funciones.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

bool? isChecked = false;

class _PaymentState extends State<Payment> {
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
                      boton(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Order();
                            },
                          ),
                        );
                      }, Color.fromARGB(0, 255, 255, 255), "<", Colors.white,
                          screenwidth * 0.11, screenheight * 0.055, 30, 50),
                      SizedBox(
                        width: screenwidth * 0.01,
                      ),
                      txt("Selecciona tú método de pago", Colors.white, 17,
                          "Poppins")
                    ]),
                    SizedBox(height: screenheight * 0.04),
                    Transform.scale(
                        scale: 1,
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: CheckboxListTile(
                                title:
                                Align(alignment: Alignment.centerLeft,
                                child:txt("Efectivo", Colors.white, 16, "Roboto")),
                                controlAffinity:
                                    ListTileControlAffinity.platform,
                                value: isChecked,
                                contentPadding:
                                    EdgeInsets.only(right: 40, left: 40),
                                secondary: SizedBox(
                                  width: 40,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Image.asset(
                                      "assets/imgs/wallet.png",
                                      scale: 0.8,
                                    ),
                                  ),
                                ),
                                checkboxShape: CircleBorder(),
                                activeColor: Color(0xFFEBA503),
                                checkColor: Colors.white,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                })))
                  ],
                ))));
  }
}
