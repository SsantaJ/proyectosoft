import 'package:flutter/material.dart';
import 'package:proyectosoft/vistas/Menu.dart';
import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/vistas/profile.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
import 'package:proyectosoft/widgets/custom_botonicon.dart';
import 'package:proyectosoft/vistas/welcomePage.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';
import 'package:proyectosoft/widgets/custom_botonf.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenwidth = 0.0;
  double screenheight = 0.0;
  final estados = [Order(), Home(), const profile()];
  int index = 1;

  @override
  Widget build(BuildContext context) {
    screenheight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: estados[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(indicatorColor: Colors.transparent),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              label: "Carrito",
              selectedIcon:
                  Icon(Icons.shopping_cart_outlined, color: Color(0xFFEBA503)),
            ),
            NavigationDestination(
              icon: Icon(Icons.store, color: Colors.white),
              label: "Inicio",
              selectedIcon: Icon(
                Icons.store_outlined,
                color: Color(0xFFEBA503),
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.person, color: Colors.white),
              label: "Perfil",
              selectedIcon:
                  Icon(Icons.person_outline, color: Color(0xFFEBA503)),
            )
          ],
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          backgroundColor: const Color.fromARGB(255, 86, 120, 193),
          height: screenheight * 0.07,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final ignorar = TextEditingController();

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
                height: (screenheight * 0.1),
              ),
              CustomTextField(
                  obs: false,
                  text: "Busca tu plato",
                  x: screenwidth * 0.8,
                  y: screenheight * 0.07,
                  color: Colors.white,
                  controlador: ignorar),
              SizedBox(
                height: screenheight * 0.06,
              ),

              Row(
                children: [
                  Flexible(
                    child: Container(),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: screenheight * 0.1,
                        width: screenwidth * 0.2,
                        child: Custombotonf(
                            funcion: () {},
                            color: Colors.white,
                            img: "assets/imgs/coffee.png",
                            color2: Color.fromARGB(0, 255, 193, 7),
                            x: screenwidth * 0.1,
                            y: screenheight * 0.2,
                            border: 10,
                            tamimg: 80,
                            grosor: 0),
                      ),
                      const CustomText(
                        text: "Postres",
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Poppins",
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: screenheight * 0.1,
                        width: screenwidth * 0.2,
                        child: Custombotonf(
                            funcion: () {},
                            color: Colors.amber,
                            img: "assets/imgs/burgeri.png",
                            color2: Color.fromARGB(0, 255, 193, 7),
                            x: screenwidth * 0.1,
                            y: screenheight * 0.2,
                            border: 10,
                            tamimg: 80,
                            grosor: 0),
                      ),
                      const CustomText(
                        text: "Postres",
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Poppins",
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: screenheight * 0.1,
                        width: screenwidth * 0.2,
                        child: Custombotonf(
                            funcion: () {},
                            color: Colors.white,
                            img: "assets/imgs/piece.png",
                            color2: Color.fromARGB(0, 255, 193, 7),
                            x: screenwidth * 0.1,
                            y: screenheight * 0.2,
                            border: 10,
                            tamimg: 80,
                            grosor: 0),
                      ),
                      const CustomText(
                        text: "Postres",
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Poppins",
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              const CustomText(
                text: "Menu",
                fontFamily: "Poppins",
                fontSize: 15,
                color: Colors.white,
              ),
              const Spacer(),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      width: screenwidth * 0.15,
                    ),
                  ),
                  Custombotonf(
                      funcion: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const menu();
                            },
                          ),
                        );
                      },
                      color: const Color.fromARGB(102, 52, 152, 219),
                      img: "assets/imgs/burger.png",
                      color2: Color.fromARGB(0, 233, 30, 98),
                      x: screenheight * 0.17,
                      y: screenwidth * 0.3,
                      border: 15,
                      tamimg: 2,
                      grosor: 0),
                  Flexible(
                    child: Container(),
                  ),
                  Custombotonf(
                      funcion: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const menu();
                            },
                          ),
                        );
                      },
                      color: const Color.fromARGB(102, 52, 152, 219),
                      img: "assets/imgs/burger.png",
                      color2: Color.fromARGB(0, 233, 30, 98),
                      x: screenheight * 0.17,
                      y: screenwidth * 0.3,
                      border: 15,
                      tamimg: 2,
                      grosor: 0),
                  Flexible(
                    child: Container(
                      width: screenwidth * 0.15,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      width: screenwidth * 0.15,
                    ),
                  ),
                  Custombotonf(
                      funcion: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const menu();
                            },
                          ),
                        );
                      },
                      color: const Color.fromARGB(102, 52, 152, 219),
                      img: "assets/imgs/burger.png",
                      color2: Color.fromARGB(0, 233, 30, 98),
                      x: screenheight * 0.17,
                      y: screenwidth * 0.3,
                      border: 15,
                      tamimg: 2,
                      grosor: 0),
                  Flexible(
                    child: Container(),
                  ),
                  Custombotonf(
                      funcion: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const menu();
                            },
                          ),
                        );
                      },
                      color: const Color.fromARGB(102, 52, 152, 219),
                      img: "assets/imgs/burger.png",
                      color2: Color.fromARGB(0, 233, 30, 98),
                      x: screenheight * 0.17,
                      y: screenwidth * 0.3,
                      border: 15,
                      tamimg: 2,
                      grosor: 0),
                  Flexible(
                    child: Container(
                      width: screenwidth * 0.15,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 5,
              ),

              //CAMBIAR EN CART_CARD LOS PLACEHOLDERS, Y TEXTO DE PRECIO QUE ESTA EN BOLD
              /* cart_card(screenheight: screenheight, screenwidth: screenwidth),
              SizedBox(
                height: screenheight * 0.04,
              ),
              cart_card(screenheight: screenheight, screenwidth: screenwidth),
              SizedBox(
                height: screenheight * 0.04,
              ),
              cart_card(screenheight: screenheight, screenwidth: screenwidth),
              Flexible(child: Container()),
              boton(() {}, Color(0xFFEBA503), "Enviar", Colors.white,
                  screenwidth * 0.8, screenheight * 0.06, 20),
              SizedBox(
                height: screenheight * 0.04,
              ), */
            ],
          )),
    ));
  }
}
