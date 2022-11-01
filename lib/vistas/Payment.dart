import 'package:flutter/material.dart';
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
                                  return const Order();
                                },
                              ),
                            );
                          },
                          color: const Color.fromARGB(0, 255, 255, 255),
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
                        const CustomText(
                            text: "Efectivo",
                            fontFamily: "Roboto",
                            fontSize: 16,
                            color: Colors.white),
                        const Spacer(),
                        Transform.scale(
                            scale: 1.7,
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                              activeColor: const Color(0xFFEBA503),
                              checkColor: Colors.white,
                              shape: const CircleBorder(),
                            )),
                        Padding(
                            padding: EdgeInsets.only(right: screenwidth * 0.1))
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: screenheight * 0.06)),
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
                        const CustomText(
                            text: "Tarjeta de Crédito",
                            fontFamily: "Roboto",
                            fontSize: 12,
                            color: Colors.white),
                        const Spacer(),
                        const CustomText(
                            text: "4444 **** **** 5782",
                            fontFamily: "Roboto",
                            fontSize: 10,
                            color: Colors.white),
                        Custombotontxt(
                            funcion: () {},
                            color: const Color.fromARGB(0, 255, 255, 255),
                            text: ">",
                            color2: Colors.white,
                            x: screenwidth * 0.11,
                            y: screenheight * 0.055,
                            border: 50,
                            tamtxt: 30),
                        Padding(
                            padding: EdgeInsets.only(right: screenwidth * 0.09))
                      ],
                    )
                  ],
                ))));
  }
}
