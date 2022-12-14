import 'package:proyectosoft/vistas/Home.dart';
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

  final TextEditingController _adressController = TextEditingController();
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
            height: (screenheight * 0.05),
          ),
          Container(
            decoration: const BoxDecoration(),
            alignment: const Alignment(-0.85, -0.1),
            child: const CustomText(
              text: "Registrate",
              color: Palette.complement,
              fontSize: 20,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
            obs: false,
            text: "Correo electronico",
            x: screenwidth * 0.85,
            y: screenheight * 0.065,
            color: Colors.white,
            colorbg: Colors.white,
            controlador: _emailController,
          ),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: false,
              text: "Usuario",
              x: screenwidth * 0.85,
              y: screenheight * 0.065,
              color: Colors.white,
              colorbg: Colors.white,
              controlador: _userController),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: true,
              text: "Contrase??a",
              x: screenwidth * 0.85,
              y: screenheight * 0.065,
              color: Colors.white,
              colorbg: Colors.white,
              controlador: _passwordController),
          SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: true,
              text: "Repite tu contrase??a",
              x: screenwidth * 0.85,
              y: screenheight * 0.065,
              color: Colors.white,
              colorbg: Colors.white,
              controlador: ignorar),
          /* SizedBox(
            height: (screenheight * 0.02),
          ),
          CustomTextField(
              obs: false,
              text: "Direcci??n",
              x: screenwidth * 0.85,
              y: screenheight * 0.065,
              color: Colors.white,
              colorbg: Colors.white,
              controlador: _adressController), */
          SizedBox(
            height: (screenheight * 0.03),
          ),
          Custombotontxt(
              funcion: () {
                if (_passwordController.text.length >= 6) {
                  CustomAuth.registerWithEmailAndPassword(
                    email: _emailController.text,
                    pass: _passwordController.text,
                    userName: _userController.text,
                    adress: _adressController.text,
                    context: context,
                  ).then((value) => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      )));
                } else {
                  FocusManager.instance.primaryFocus?.unfocus();
                  final snackbar = SnackBar(
                      content: CustomText(
                          text: "La contrase??a debe de tener m??nimo 6 digitos",
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Palette.complement),
                      backgroundColor: Palette.seccomponent);
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(snackbar);
                }
              },
              color: Palette.complement,
              text: "Registrarse",
              color2: Palette.secondary,
              x: screenwidth * 0.85,
              y: screenheight * 0.065,
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
