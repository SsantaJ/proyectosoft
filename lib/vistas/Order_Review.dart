import 'package:flutter/material.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/widgets/review_card.dart';

import '../widgets/custom_back_arrow.dart';
import '../widgets/custom_botontxt.dart';
import '../widgets/custom_text.dart';

class Order_Review extends StatelessWidget {
  const Order_Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: screenwidth,
          height: screenheight,
          decoration: const BoxDecoration(
            color: Palette.complement,
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: screenheight * 0.05)),
              Row(children: [
                SizedBox(
                  width: screenwidth * 0.08,
                ),
                CustomBackArrow(
                    funcion: () {
                      Navigator.pop(context);
                    },
                    dir: true,
                    color: Palette.seccomponent),
                SizedBox(
                  width: screenwidth * 0.13,
                ),
                const CustomText(
                  text: "Pago de Producto",
                  color: Palette.seccomponent,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ]),
              const Divider(color: Palette.transparent,),
              const CustomText(
                  text: "Método de pago",
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: Palette.seccomponent),
              const Divider(color: Palette.transparent),
              review_card(screenheight: screenheight, screenwidth: screenwidth),
              const Divider(color: Palette.transparent),
              review_card(screenheight: screenheight, screenwidth: screenwidth),
              const Divider(color: Palette.transparent),
              review_card(screenheight: screenheight, screenwidth: screenwidth),
              const Spacer(flex: 3),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: screenwidth * 0.05)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                          text: "Sub-Total: \$299.47",
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Palette.seccomponent),
                      const CustomText(
                          text: "Domcilio: \$5",
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Palette.seccomponent),
                      SizedBox(
                        width: screenwidth * 0.9,
                        height: 2,
                        child: Container(
                          color: const Color(0XFF34495E),
                        ),
                      ),
                      Row(
                        children: [
                          const CustomText(
                              text: "Total: \$304.97",
                              fontFamily: "Poppins",
                              fontSize: 14,
                              color: Palette.seccomponent),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: screenheight * 0.16)),
                          const Icon(
                            Icons.pin_drop_rounded,
                            color: Palette.seccomponent,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 15)),
                          const CustomText(
                              text: "Cra 90 #900",
                              fontFamily: "Poppins",
                              fontSize: 10,
                              color: Palette.seccomponent)
                        ],
                      ),
                      const CustomText(
                          text: "Cambio: \$15",
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Palette.seccomponent),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Custombotontxt(
                  funcion: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Order_Review();
                        },
                      ),
                    );
                  },
                  color: Palette.primary,
                  text: "Pagar",
                  color2: Palette.complement,
                  x: screenwidth * 0.8,
                  y: screenheight * 0.06,
                  border: 50,
                  tamtxt: 20),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
