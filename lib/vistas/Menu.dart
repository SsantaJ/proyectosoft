import 'package:flutter/material.dart';
import 'package:proyectosoft/db/database.dart';
import 'package:proyectosoft/vistas/Home.dart';
import 'package:proyectosoft/widgets/add_button.dart';
import 'package:proyectosoft/widgets/custom_back_arrow.dart';

class menu extends StatelessWidget {
  const menu({Key? key}) : super(key: key);

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
            color: Color.fromARGB(255, 75, 109, 184),
          ),
          child: Column(
            children: [
              SizedBox(
                height: (screenheight * 0.06),
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenwidth * 0.08,
                  ),
                  CustomBackArrow(
                      funcion: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            },
                          ),
                        );
                      },
                      dir: true,
                      color: Colors.white),
                  SizedBox(
                    width: screenwidth * 0.1,
                  ),
                ],
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              //CAMBIAR EN CART_CARD LOS PLACEHOLDERS, Y TEXTO DE PRECIO QUE ESTA EN BOLD
              add_button(screenheight: screenheight, screenwidth: screenwidth, stream: Database.readItems()),
              SizedBox(
                height: screenheight * 0.04,
              ),
              add_button(screenheight: screenheight, screenwidth: screenwidth, stream: Database.readItems()),
              SizedBox(
                height: screenheight * 0.04,
              ),
              add_button(screenheight: screenheight, screenwidth: screenwidth, stream: Database.readItems()),
              Flexible(
                child: Container(),
              ),

              SizedBox(
                height: screenheight * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
