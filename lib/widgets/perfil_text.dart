import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

import '../util/Palette.dart';

class perfil_text extends StatelessWidget {
  const perfil_text({
    Key? key,
    required this.main,
    required this.info,
    required this.tick,
  }) : super(key: key);

  final String main;
  final String info;
  final double tick;

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
                color: Palette.seccomponent),
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
                  color: Palette.seccomponent,
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
              color: Palette.primary,
            ),
          ],
        ),
        Divider(
          height: 7,
          thickness: tick,
        ),
      ],
    );
  }
}
