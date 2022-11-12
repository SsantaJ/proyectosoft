import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class perfil_text extends StatelessWidget {
  const perfil_text({
    Key? key,
    required this.main,
    required this.info,
  }) : super(key: key);

  final String main;
  final String info;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: screenwidth * 0.03,
            ),
            CustomText(
                text: main,
                fontFamily: "Poppins",
                fontSize: 20,
                color: Colors.black),
            Flexible(
              child: Container(),
            ),
            GestureDetector(
              onTap: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const menu();
                    },
                  ),
                ); */
              },
              child: Transform.scale(
                scale: -1,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: screenwidth * 0.03,
            ),
          ],
        ),
        SizedBox(
          height: screenwidth * 0.01,
        ),
        Row(
          children: [
            SizedBox(
              width: screenwidth * 0.03,
            ),
            CustomText(
              text: info,
              fontFamily: "Poppins",
              fontSize: 14,
              color: const Color.fromARGB(255, 75, 109, 184),
            ),
          ],
        ),
      ],
    );
  }
}
