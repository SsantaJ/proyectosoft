import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/widgets/custom_back_arrow.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';

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
                      Padding(padding: EdgeInsets.only(left: screenwidth*0.1)),
                      CustomBackArrow(funcion: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Order();
                                }));}, dir: true, color: Colors.white),
                      SizedBox(
                        width: screenwidth * 0.03,
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
                        Transform.scale(
                            scale: 1.7,
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                              activeColor: Color(0xFFFF7613),
                              checkColor: Colors.white,
                              shape: CircleBorder(),
                            )),
                        Padding(
                            padding: EdgeInsets.only(right: screenwidth * 0.07))
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: screenheight * 0.04)),
                    if(isChecked == true)
                    CustomTextField(obs: false, text: "¿Con cuanto piensas pagar?", x: screenwidth*0.9, y: screenheight*0.07, color: Colors.white),
                    if(isChecked == true)Padding(padding: EdgeInsets.only(top: screenheight * 0.04)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: screenwidth * 0.1)),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Image.asset(
                              "assets/imgs/tarjeta.png",
                              scale: 0.8,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: screenwidth * 0.05)),
                        CustomText(
                            text: "Tarjeta de Crédito",
                            fontFamily: "Roboto",
                            fontSize: 12,
                            color: Colors.white),
                        Spacer(),
                        CustomText(
                            text: "4444 **** **** 5782",
                            fontFamily: "Roboto",
                            fontSize: 10,
                            color: Colors.white),
                        CustomBackArrow(funcion: (){}, dir: false, color: Colors.white),
                        Padding(
                            padding: EdgeInsets.only(right: screenwidth * 0.1))
                      ],
                    ),
                    
                  ],
                ))));
  }
}
