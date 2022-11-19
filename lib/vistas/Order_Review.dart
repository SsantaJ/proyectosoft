import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectosoft/Provider/MenuProvider.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/widgets/review_card.dart';

import '../Provider/UserProvider.dart';
import '../db/database.dart';
import '../widgets/custom_back_arrow.dart';
import '../widgets/custom_botontxt.dart';
import '../widgets/custom_text.dart';

class Order_Review extends StatelessWidget {
  const Order_Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
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
              Padding(padding: EdgeInsets.only(top: screenheight * 0.05)),
              Row(children: [
                SizedBox(
                  width: screenwidth * 0.08,
                ),
                CustomBackArrow(
                    funcion: () {
                      Navigator.pop(context);
                    },
                    dir: true,
                    color: Palette.seccomponent),
                SizedBox(
                  width: screenwidth * 0.13,
                ),
                const CustomText(
                  text: "Pago de Producto",
                  color: Palette.seccomponent,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ]),
              const Divider(color: Palette.transparent,),
              Visibility(visible: context.watch<MenuProvider>().pay == "Con tarjeta", replacement: CustomText(
                  text: "Efectivo con: "+context.watch<MenuProvider>().pay,
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: Palette.seccomponent),
                  child: CustomText(
                  text: context.watch<MenuProvider>().pay,
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: Palette.seccomponent),),
              SizedBox(
                  height: screenheight * 0.58,
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
                                int price = int.parse(itemInfo['Precio']);
                                int can = itemInfo['Cantidad'];
                                String url = itemInfo['Img'];
                                return review_card(
                                    screenheight: screenheight,
                                    screenwidth: screenwidth,
                                    nombre: name,
                                    precio: price.toString(),
                                    can: can,
                                    uid: context
                                        .watch<UserProvider>()
                                        .customUser
                                        .uid,
                                    url: url);
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
                Spacer(),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: screenwidth * 0.05)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Sub-Total: \$"+context.watch<MenuProvider>().subtotal.toString(),
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Palette.seccomponent),
                      const CustomText(
                          text: "Domcilio: \$5000",
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Palette.seccomponent),
                      SizedBox(
                        width: screenwidth * 0.9,
                        height: 2,
                        child: Container(
                          color: Palette.seccomponent,
                        ),
                      ),
                      Row(
                        children: [
                          CustomText(
                              text: "Total: \$"+(context.watch<MenuProvider>().subtotal+5000).toString(),
                              fontFamily: "Poppins",
                              fontSize: 14,
                              color: Palette.seccomponent),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: screenheight * 0.16)),
                          const Icon(
                            Icons.pin_drop_rounded,
                            color: Palette.seccomponent,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 15)),
                          const CustomText(
                              text: "Cra 90 #900",
                              fontFamily: "Poppins",
                              fontSize: 10,
                              color: Palette.seccomponent)
                        ],
                      ),
                      if(context.watch<MenuProvider>().pay == "Con tarjeta")
                      CustomText(
                          text: "Cambio: \$0",
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Palette.seccomponent),
                      if(context.watch<MenuProvider>().pay != "Con tarjeta")
                      CustomText(
                          text: "Cambio: \$"+(int.parse(context.watch<MenuProvider>().pay)-(context.watch<MenuProvider>().subtotal+5000)).toString(),
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Palette.seccomponent)
                    ],
                  )
                ],
              ),
              const Spacer(),
              Custombotontxt(
                  funcion: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Order_Review();
                        },
                      ),
                    );
                  },
                  color: Palette.primary,
                  text: "Pagar",
                  color2: Palette.complement,
                  x: screenwidth * 0.8,
                  y: screenheight * 0.06,
                  border: 50,
                  tamtxt: 20),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
