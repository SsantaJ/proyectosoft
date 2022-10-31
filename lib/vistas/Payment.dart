import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';

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
                      Custombotontxt(
                          funcion: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Order();
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
                        width: screenwidth * 0.01,
                      ),
                      const CustomText(
                        text: "Selecciona tú método de pago",
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: "Poppins",
                      ),
                    ]),
                    SizedBox(height: screenheight * 0.04),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: screenwidth * 0.1)),
                        SizedBox(
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
                        Padding(
                            padding: EdgeInsets.only(left: screenwidth * 0.05)),
                        CustomText(
                            text: "Efectivo",
                            fontFamily: "Roboto",
                            fontSize: 16,
                            color: Colors.white),
                        Spacer(),
                        Transform.scale(scale: 1.7, child: Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                          activeColor: Color(0xFFEBA503),
                          checkColor: Colors.white,
                          shape: CircleBorder(),
                        ))
                        ,
                        Padding(padding: EdgeInsets.only(right: screenwidth*0.1))
                      ],
                    )
                  ],
                ))));
  }
}
