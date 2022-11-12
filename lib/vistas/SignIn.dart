// ignore_for_file: file_names
import 'package:proyectosoft/vistas/Home.dart';
import 'package:proyectosoft/widgets/custom_back_arrow.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final usuario = TextEditingController();
  final password = TextEditingController();

  String usu = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: screenwidth,
          height: screenheight,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 75, 109, 184),
          ),
          child: Column(children: [
            SizedBox(
              height: (screenheight * 0.06),
            ),
            Align(
              alignment: const Alignment(-0.88, 0),
              child: CustomBackArrow(
                  funcion: () {
                    Navigator.pop(context);
                  },
                  dir: true,
                  color: Colors.white),
            ),
            SizedBox(
              height: (screenheight * 0.02),
            ),
            Container(
              decoration: const BoxDecoration(),
              alignment: const Alignment(-0.85, -0.1),
              child: const CustomText(
                text: "Ingresar",
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Poppins",
              ), //no sirve el height
            ),
            SizedBox(
              height: (screenheight * 0.045),
            ),
            CustomTextField(
              obs: false,
              text: "Usuario",
              x: screenwidth * 0.9,
              y: screenheight * 0.07,
              color: Colors.white,
              controlador: usuario,
            ),
            SizedBox(
              height: (screenheight * 0.02),
            ),
            CustomTextField(
              obs: true,
              text: "Contraseña",
              x: screenwidth * 0.9,
              y: screenheight * 0.07,
              color: Colors.white,
              controlador: password,
            ),
            SizedBox(
              height: (screenheight * 0.04),
            ),
            Custombotontxt(
                funcion: () {
                  usu = usuario.text;
                  pass = password.text;

                  print('$usu-----$pass');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                },
                color: const Color.fromARGB(255, 235, 165, 3),
                text: "Iniciar Sesion",
                color2: Colors.white,
                x: screenwidth * 0.9,
                y: screenheight * 0.075,
                border: 50,
                tamtxt: 20),
            Flexible(
              child: Container(),
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
          ]),
        ));
  }
}
