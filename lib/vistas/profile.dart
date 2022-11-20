import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectosoft/Provider/UserProvider.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/vistas/ChangeData.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/perfil_text.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    ;
    return Scaffold(
      body: Center(
        child: Container(
          width: screenwidth,
          height: screenheight,
          decoration: const BoxDecoration(
            color: Palette.complement,
          ),
          child: Column(
            children: [
              SizedBox(
                height: (screenheight * 0.06),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.network(
                  "https://static-cdn.jtvnw.net/jtv_user_pictures/2507d5ab-22ce-4f7e-8f38-ccefce4e5aac-profile_image-150x150.png",
                ),
              ),
              CustomText(
                text: context
                    .watch<UserProvider>()
                    .customUser
                    .userName
                    .toString(),
                fontFamily: "Poppins",
                fontSize: 20,
                color: Palette.seccomponent,
              ),
              const Text(
                "+57 3218759535",
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.primary,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Poppins"),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              perfil_text(
                main: "Correo electrónico",
                info: context.watch<UserProvider>().customUser.email.toString(),
                tick: 1,
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              const perfil_text(
                main: "Método de pago",
                info: "Tarjeta debito Bancolombia",
                tick: 1,
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              const perfil_text(
                main: "Dirección",
                info: "Crra 47 #78-34",
                tick: 1,
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              const perfil_text(
                main: "Cambiar contraseña",
                info: "",
                tick: 0.0000001,
              ),
              SizedBox(
                height: screenheight * 0.1,
              ),
              Custombotontxt(
                  funcion: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ChangeData();
                        },
                      ),
                    );
                  },
                  color: Palette.secondary,
                  text: "Editar perfil",
                  color2: Palette.primary,
                  x: screenwidth * 0.8,
                  y: screenheight * 0.05,
                  border: 30,
                  tamtxt: 18)
            ],
          ),
        ),
      ),
    );
  }
}
