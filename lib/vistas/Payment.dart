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

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    bool? isChecked = true;
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
                    SizedBox(
                      height: screenheight*0.04
                    ),
                    SizedBox(
                     width: screenwidth * 0.8,
                     height: screenheight * 0.07,
                     child:  CheckboxListTile(
                     title: txt("Efectivo", Colors.white, 15, "Roboto"),
                     controlAffinity: ListTileControlAffinity.trailing,
                     value: isChecked,
                     activeColor: Colors.green,
                     checkColor: Colors.black,
                     onChanged: (bool? value){
                      setState(() {
                        isChecked = value;
                      });
                    })
                    )
                  ],
                ))));
  }
}
