import 'package:flutter/material.dart';
import 'package:proyectosoft/vistas/Menu.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class perfil_text extends StatelessWidget {
  const perfil_text({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(
          width: screenwidth * 0.03,
        ),
        CustomText(
            text: text,
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
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: screenwidth * 0.03,
        ),
      ],
    );
  }
}
