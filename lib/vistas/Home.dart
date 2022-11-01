import 'package:flutter/material.dart';
import 'package:proyectosoft/vistas/Menu.dart';
import 'package:proyectosoft/vistas/Order.dart';
import 'package:proyectosoft/vistas/profile.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
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
  final estados = [const Home(), const profile(), const Order()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    screenheight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: estados[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(indicatorColor: Color(0xFFEBA503)),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Inicio",
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: "Perfil",
              selectedIcon: Icon(Icons.person),
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Carrito",
              selectedIcon: Icon(Icons.shopping_cart),
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
  const Home({Key? key}) : super(key: key);

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

              SizedBox(
                width: screenwidth * 0.08,
              ),
              SizedBox(
                width: screenwidth * 0.1,
              ),
              Row(
                children: [
                  Custombotontxt(
                      funcion: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const WelcomePage();
                            },
                          ),
                        );
                      },
                      color: const Color.fromARGB(0, 255, 255, 255),
                      text: "<",
                      color2: Colors.white,
                      x: screenwidth * 0.11,
                      y: screenheight * 0.055,
                      border: 50,
                      tamtxt: 30),
                  CustomTextField(
                      obs: false,
                      text: "Busca tu plato",
                      x: screenwidth * 0.8,
                      y: screenheight * 0.07,
                      color: Colors.white),
                ],
              ),
              SizedBox(
                height: (screenheight * 0.02),
              ),
              SizedBox(
                height: screenheight * 0.04,
              ),

              Row(
                children: [
                  Flexible(
                    child: Container(),
                  ),
                  SizedBox(
                    height: screenheight * 0.1,
                    width: screenwidth * 0.2,
                    child: Custombotontxt(
                        funcion: () {},
                        color: Colors.white,
                        text: "aaa",
                        color2: Colors.amber,
                        x: screenwidth * 0.1,
                        y: screenheight * 0.2,
                        border: 10,
                        tamtxt: 10),
                    /* boton(() {}, Colors.white, "aaa", Colors.amber,
                        screenheight * 0.1, screenwidth * 0.2, 10, 10),*/
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  SizedBox(
                    height: screenheight * 0.1,
                    width: screenwidth * 0.2,
                    child: Custombotontxt(
                        funcion: () {},
                        color: Colors.amber,
                        text: "a",
                        color2: Colors.white,
                        x: screenwidth * 0.1,
                        y: screenheight * 0.2,
                        border: 10,
                        tamtxt: 10),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  SizedBox(
                    height: screenheight * 0.1,
                    width: screenwidth * 0.2,
                    child: Custombotontxt(
                        funcion: () {},
                        color: Colors.white,
                        text: "aaa",
                        color2: Colors.amber,
                        x: screenwidth * 0.1,
                        y: screenheight * 0.2,
                        border: 10,
                        tamtxt: 10),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                ],
              ),
              const CustomText(
                text: "text",
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Poppins",
              ),
              SizedBox(
                height: (screenheight * 0.05),
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
                  color: Colors.green,
                  img: "assets/imgs/burger.png",
                  color2: Colors.pink,
                  x: screenheight * 0.1,
                  y: screenwidth * 0.2,
                  border: 3,
                  tamimg: 2),

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
