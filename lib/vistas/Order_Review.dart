import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
            color: Color.fromARGB(255, 75, 109, 184),
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: screenheight*0.05)),
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
                  text: "Carrito de comida",
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
