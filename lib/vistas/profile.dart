import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/perfil_text.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: screenwidth,
          height: screenheight,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: (screenheight * 0.06),
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.network(
                    "https://static-cdn.jtvnw.net/jtv_user_pictures/2507d5ab-22ce-4f7e-8f38-ccefce4e5aac-profile_image-150x150.png",
                  ),
                ),
              ),
              const CustomText(
                text: "USER",
                fontFamily: "Poppins",
                fontSize: 20,
                color: Colors.black,
              ),
              const Text(
                "+57 3218759535",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Poppins"),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              const perfil_text(
                main: "Correo electrónico",
                info: "tucorreo@mmfood.com",
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              const perfil_text(
                main: "Método de pago",
                info: "Tarjeta debito Bancolombia",
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              const perfil_text(
                main: "Dirección",
                info: "Crra 47 #78-34",
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              const perfil_text(
                main: "Cambiar contraseña",
                info: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
