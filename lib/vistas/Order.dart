import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectosoft/Provider/MenuProvider.dart';
import 'package:proyectosoft/Provider/UserProvider.dart';
import 'package:proyectosoft/vistas/Payment.dart';
import 'package:proyectosoft/widgets/cart_card.dart';
import 'package:proyectosoft/widgets/custom_text.dart';
import 'package:proyectosoft/widgets/custom_botontxt.dart';

import '../db/database.dart';
import '../util/Palette.dart';

class Order extends StatelessWidget {
  Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    context
        .read<MenuProvider>()
        .checkEmpty(uid: context.watch<UserProvider>().customUser.uid);
    return Scaffold(
        body: Center(
      child: Visibility(
        visible: !context.watch<MenuProvider>().Empty,
        replacement: Container(
            width: screenwidth,
            height: screenheight,
            decoration: const BoxDecoration(
              color: Palette.complement,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "El Carrito esta vacio empieza agregando algo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Palette.seccomponent,
                      fontSize: 25,
                      fontFamily: "Poppins"),
                ),
              ],
            )),
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
                const CustomText(
                  text: "Carrito de comida",
                  color: Palette.seccomponent,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
                SizedBox(
                  height: screenheight * 0.02,
                ),
                SizedBox(
                  height: screenheight * 0.68,
                  width: screenwidth * 0.86,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: Database.readCart(
                          usuario:
                              context.watch<UserProvider>().customUser.uid),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text(
                              'Hubo un error en la carga. Por favor intenta nuevamente en un rato');
                        } else if (snapshot.hasData || snapshot.data != null) {
                          return ListView.separated(
                              itemBuilder: ((context, index) {
                                var itemInfo = snapshot.data!.docs[index]
                                    .data()! as Map<String, dynamic>;
                                String docID = snapshot.data!.docs[index].id;
                                String name = itemInfo['Nombre'];
                                String price = itemInfo['Precio'].toString();
                                int can = itemInfo['Cantidad'];
                                String url = itemInfo['Img'];

                                return cart_card(
                                    screenheight: screenheight,
                                    screenwidth: screenwidth,
                                    nombre: name,
                                    precio: price,
                                    can: can,
                                    docID: docID,
                                    user: context
                                        .watch<UserProvider>()
                                        .customUser
                                        .uid,
                                    img: url);
                              }),
                              separatorBuilder: ((context, index) =>
                                  const SizedBox(
                                    height: 16,
                                  )),
                              itemCount: snapshot.data!.docs.length);
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Palette.complement,
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: screenheight * 0.02,
                ),
                Custombotontxt(
                    funcion: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Payment();
                          },
                        ),
                      );
                    },
                    color: Palette.secondary,
                    text: "Llevar",
                    color2: Palette.complement,
                    x: screenwidth * 0.85,
                    y: screenheight * 0.055,
                    border: 50,
                    tamtxt: 20),
                SizedBox(
                  height: screenheight * 0.04,
                ),
              ],
            )),
      ),
    ));
  }
}
