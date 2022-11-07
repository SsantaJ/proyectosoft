import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/widgets/review_card.dart';

import '../widgets/custom_back_arrow.dart';
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
            color: Palette.primary,
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
                    color: Colors.white),
                SizedBox(
                  width: screenwidth * 0.13,
                ),
                const CustomText(
                  text: "Pago de Producto",
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ]),
              CustomText(
                  text: "Método de pago",
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: Colors.white),
              review_card(screenheight: screenheight, screenwidth: screenwidth),
              review_card(screenheight: screenheight, screenwidth: screenwidth),
              review_card(screenheight: screenheight, screenwidth: screenwidth),
              Row(
                children: [Padding(padding: EdgeInsets.only(left: screenwidth*0.05)),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Sub-Total: \$299.47",
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.white),
                      CustomText(
                          text: "Domcilio: \$5",
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.white),
                          SizedBox(
                            width: screenwidth*0.9,
                            height: 3,
                            child: Container(
                              color: Color(0XFF34495E),
                            ),
                          ),
                      CustomText(
                          text: "Total: \$304.97",
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Colors.white),
                      CustomText(
                          text: "Cambio: \$15",
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Colors.white),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
