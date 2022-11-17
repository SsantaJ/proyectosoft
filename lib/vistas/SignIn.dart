// ignore_for_file: file_names
import 'package:proyectosoft/vistas/Home.dart';
import 'package:proyectosoft/widgets/custom_back_arrow.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';
import '../util/Palette.dart';
import 'package:proyectosoft/util/validator.dart';
import '../auth/auth.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          color: Palette.primary,
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
              controlador: _emailController,
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
              controlador: _passwordController,
            ),
            SizedBox(
              height: (screenheight * 0.04),
            ),
            Custombotontxt(
                funcion: () {
                  CustomAuth.signInWithEmailAndPassword(
                        email: _emailController.text,
                        pass: _passwordController.text,
                        context: context,
                      ).then((value) {
                        if(value){
                          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ),
                );
                        }
                      });

                  usu = _emailController.text;
                  pass = _passwordController.text;
        

                print('$usu-----$pass');

                
              },
              color: Palette.secondary,
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
      ),
    );
  }
}
