import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyectosoft/Provider/MenuProvider.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/vistas/Menu.dart';
import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/vistas/profile.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
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
      resizeToAvoidBottomInset: false,
      body: estados[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(color: Palette.secondary, fontSize: 12))),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.shopping_cart, color: Palette.complement),
              label: "Carrito",
              selectedIcon:
                  Icon(Icons.shopping_cart_outlined, color: Palette.secondary),
            ),
            NavigationDestination(
              icon: Icon(Icons.store, color: Palette.complement),
              label: "Inicio",
              selectedIcon: Icon(
                Icons.store_outlined,
                color: Palette.secondary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.person, color: Palette.complement),
              label: "Perfil",
              selectedIcon:
                  Icon(Icons.person_outline, color: Palette.secondary),
            )
          ],
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          backgroundColor: Palette.primary,
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: (screenheight * 0.1),
              ),
              CustomTextField(
                  obs: false,
                  text: "Busca tu plato",
                  x: screenwidth * 0.85,
                  y: screenheight * 0.065,
                  color: Colors.white,
                  colorbg: Color(0XFFEFE5B3),
                  controlador: ignorar),
              SizedBox(
                height: screenheight * 0.05,
              ),
              Row(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      const CustomText(
                        text: "Bebidas",
                        color: Palette.seccomponent,
                        fontSize: 15,
                        fontFamily: "Poppins",
                      ),
                      Custombotonf(
                          text: "",
                          funcion: () {
                            context.read<MenuProvider>().filloption("Bebidas");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const menu();
                                },
                              ),
                            );
                          },
                          ax: 0,
                          ay: 0,
                          color: Color(0XFFEFE5B3),
                          img: "assets/imgs/coffee.png",
                          color2: Palette.transparent,
                          x: screenwidth * 0.21,
                          y: screenwidth * 0.21,
                          border: 20,
                          tamimg: 1,
                          grosor: 0),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const CustomText(
                        text: "Platos",
                        color: Palette.seccomponent,
                        fontSize: 15,
                        fontFamily: "Poppins",
                      ),
                      Custombotonf(
                          text: "",
                          funcion: () {
                            context.read<MenuProvider>().filloption("Platos");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const menu();
                                },
                              ),
                            );
                          },
                          ax: 0,
                          ay: 0,
                          color: Palette.secondary,
                          img: "assets/imgs/burgeri.png",
                          color2: Palette.transparent,
                          x: screenwidth * 0.21,
                          y: screenwidth * 0.21,
                          border: 20,
                          tamimg: 1,
                          grosor: 0),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const CustomText(
                        text: "Postres",
                        color: Palette.seccomponent,
                        fontSize: 15,
                        fontFamily: "Poppins",
                      ),
                      Custombotonf(
                          funcion: () {
                            context.read<MenuProvider>().filloption("Postres");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const menu();
                                },
                              ),
                            );
                          },
                          ax: 0,
                          ay: 0,
                          color: Color(0XFFEFE5B3),
                          img: "assets/imgs/piece.png",
                          color2: Palette.transparent,
                          x: screenwidth * 0.21,
                          y: screenwidth * 0.21,
                          border: 10,
                          tamimg: 1,
                          text: "",
                          grosor: 0),
                    ],
                  ),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              Container(
                decoration: const BoxDecoration(),
                alignment: const Alignment(0, 0),
                child: const CustomText(
                  text: "Menu",
                  fontFamily: "Poppins",
                  fontSize: 35,
                  color: Palette.seccomponent,
                ),
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              Row(
                children: [
                  const Spacer(),
                  Custombotonf(
                      text: "Hamburguesas",
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
                      ax: 1,
                      ay: 1,
                      color: Palette.primary,
                      img: "assets/imgs/burger.png",
                      color2: Palette.complement,
                      x: screenheight * 0.18,
                      y: screenwidth * 0.3,
                      border: 20,
                      tamimg: 1,
                      grosor: 0),
                  const Spacer(),
                  Custombotonf(
                      text: "Pizzas",
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
                      ax: 1,
                      ay: 1,
                      color: Palette.primary,
                      img: "assets/imgs/picsa.png",
                      color2: Palette.complement,
                      x: screenheight * 0.18,
                      y: screenwidth * 0.3,
                      border: 20,
                      tamimg: 1,
                      grosor: 0),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),
              Row(
                children: [
                  const Spacer(),
                  Custombotonf(
                      text: "Frutas",
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
                      ax: 1,
                      ay: 1,
                      color: Palette.primary,
                      img: "assets/imgs/fruta.png",
                      color2: Palette.complement,
                      x: screenheight * 0.18,
                      y: screenwidth * 0.3,
                      border: 20,
                      tamimg: 1,
                      grosor: 0),
                  const Spacer(),
                  Custombotonf(
                      text: "Sushis",
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
                      ax: 1,
                      ay: 1,
                      color: Palette.primary,
                      img: "assets/imgs/suchi.png",
                      color2: Palette.complement,
                      x: screenheight * 0.18,
                      y: screenwidth * 0.3,
                      border: 20,
                      tamimg: 1,
                      grosor: 0),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: screenheight * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
