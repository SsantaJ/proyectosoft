import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 218, 244),
      body: Column(
        children: const [
          Spacer(
            flex: 1,
          ),
          Center(
            child: CustomText(
              text: "AQUI VA LA VISTA DE PERFIL",
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 65,
              fontFamily: "Poppins",
            ),
          ),
          Spacer(
            flex: 1,
          ),
          /* SizedBox(
            height: (screenheight * 0.05),
          ), */
        ],
      ),
    );
  }
}
