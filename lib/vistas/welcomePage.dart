import 'package:flutter/services.dart';
import 'package:proyectosoft/db/database.dart';
import 'package:proyectosoft/vistas/SignUp.dart';
import 'package:proyectosoft/vistas/SignIn.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

import '../util/Palette.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Palette.transparent));
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.primary,
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Wrap(
            runSpacing: -(screenwidth*0.2083),
            alignment: WrapAlignment.center,
            children: [
              CustomText(
                text: "mm",
                color: Palette.complement,
                fontSize: screenwidth*0.3255,
                fontFamily: "Poppins",
              ),
              CustomText(
                text: "food",
                color: Palette.complement,
                fontSize: screenwidth*0.3125,
                fontFamily: "Poppins",
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Custombotontxt(
              funcion: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              },
              color: Palette.secondary,
              text: "Iniciar Sesión",
              color2: Palette.complement,
              x: screenwidth * 0.85,
              y: screenheight * 0.065,
              border: 50,
              tamtxt: screenwidth*0.052),
          SizedBox(
            height: (screenheight * 0.05),
          ),
          Custombotontxt(
              funcion: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUP();
                }));
              },
              color: Palette.complement,
              text: "Registrate",
              color2: Palette.secondary,
              x: screenwidth * 0.85,
              y: screenheight * 0.065,
              border: 50,
              tamtxt: screenwidth*0.052),
          const Spacer(
            flex: 1,
          ),
          Align(
            alignment: const Alignment(-1, 1),
            child: Image.asset(
              fit: BoxFit.cover,
              "assets/imgs/platofondo.png",
              height: screenheight * 0.35,
              scale: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
