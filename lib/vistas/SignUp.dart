import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/widgets/custom_back_arrow.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';
import '../util/Palette.dart';
import '../auth/auth.dart';

class SignUP extends StatelessWidget {
  SignUP({Key? key}) : super(key: key);

  final ignorar = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _userController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.primary,
      body: Column(
        children: [
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
            height: (screenheight * 0.015),
          ),
          Container(
            decoration: const BoxDecoration(),
            alignment: const Alignment(-0.85, -0.1),
            child: const CustomText(
              text: "Registrate",
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Poppins",
            ), //no sirve el height
          ),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
            obs: false,
            text: "Correo electronico",
            x: screenwidth * 0.9,
            y: screenheight * 0.07,
            color: Colors.white,
            controlador: ignorar,
          ),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: false,
              text: "Usuario",
              x: screenwidth * 0.9,
              y: screenheight * 0.07,
              color: Colors.white,
              controlador: ignorar),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: true,
              text: "Contraseña",
              x: screenwidth * 0.9,
              y: screenheight * 0.07,
              color: Colors.white,
              controlador: ignorar),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: true,
              text: "Repita su contraseña",
              x: screenwidth * 0.9,
              y: screenheight * 0.07,
              color: Colors.white,
              controlador: ignorar),
          SizedBox(
            height: (screenheight * 0.03),
          ),
          Custombotontxt(
              funcion: () {
                
                CustomAuth.registerWithEmailAndPassword(
                      //Llamamos la función de registro
                      email: _emailController.text,
                      pass: _passwordController.text,
                      userName: _userController.text,
                      context: context,
                    ).then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Order();
                        },)));

              },
              color: Palette.complement,
              text: "Registrarse",
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
        ],
      ),
    );
  }
}
