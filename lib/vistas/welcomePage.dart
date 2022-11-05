import 'package:proyectosoft/db/database.dart';
import 'package:proyectosoft/vistas/SignUp.dart';
import 'package:proyectosoft/vistas/SignIn.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 75, 109, 184),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Stack(
            alignment: const Alignment(0, 0),
            children: [
              const CustomText(
                text: "mm",
                color: Colors.white,
                fontSize: 65,
                fontFamily: "Poppins",
              ),
              Container(
                height: screenheight * 0.28,
                alignment: const Alignment(0, 1),
                child: const CustomText(
                  text: "food",
                  color: Colors.white,
                  fontSize: 65,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Custombotontxt(
              funcion: () {
                //Database.setFirstData();

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignIn();
                }));
              },
              color: const Color.fromARGB(255, 235, 165, 3),
              text: "Iniciar Sesion",
              color2: Colors.white,
              x: screenwidth * 0.9,
              y: screenheight * 0.075,
              border: 50,
              tamtxt: 25),
          SizedBox(
            height: (screenheight * 0.05),
          ),
          Custombotontxt(
              funcion: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignUP();
                }));
              },
              color: const Color.fromARGB(255, 255, 118, 19),
              text: "Registrate",
              color2: Colors.white,
              x: screenwidth * 0.9,
              y: screenheight * 0.075,
              border: 50,
              tamtxt: 25),
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
