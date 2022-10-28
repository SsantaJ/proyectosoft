import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyectosoft/vistas/SignIn.dart';
import 'package:proyectosoft/vistas/SignUp.dart';
import 'package:proyectosoft/widgets/custom_txtField.dart';
import 'package:proyectosoft/widgets/funciones.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

Future empezar() async{
  await Firebase.initializeApp();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; //Instancia
  final CollectionReference _mainCollection = _firestore.collection('menu');//Colección in
  return await _firestore;
}

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    empezar();
    Text prueba1 = txt("mm", Colors.white, 50, "Poppins");
    Text prueba2 = txt("food", Colors.white, 50, "Poppins");
    
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 75, 109, 184),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          /* SizedBox(
            height: (screenheight * 0.1),
          ), */
          Stack(
            alignment: Alignment(0, 0),
            children: [
              txt("mm", Colors.white, 65, "Poppins"),
              Container(
                height: screenheight * 0.28,
                //padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),

                //decoration: BoxDecoration(color: Colors.green),
                child: txt("food", Colors.white, 65, "Poppins"),

                alignment: Alignment(0, 1),
              ),
            ],
          ),
          //txt("mm", Colors.white, 50, "Poppins"),
          //txt("food", Colors.white, 60, "Poppins"),
          const Spacer(
            flex: 1,
          ),
          /* SizedBox(
            height: (screenheight * 0.1),
          ), */
          boton(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignIn();
                },
              ),
            );
          }, Color.fromARGB(255, 235, 165, 3), "Inicia Sesión", Colors.white,
              screenwidth * 0.9, screenheight * 0.075, 25, 50),
          SizedBox(
            height: (screenheight * 0.05),
          ),
          boton(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUP();
                },
              ),
            );
          }, Color.fromARGB(255, 255, 118, 19), "Registrate", Colors.white,
              screenwidth * 0.9, screenheight * 0.075, 25, 50),
          Spacer(
            flex: 1,
          ),
          /* SizedBox(git 
            height: (screenheight * 0.01),
          ), */
          Align(
            alignment: Alignment(-1, 1),
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
