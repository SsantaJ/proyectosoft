import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectosoft/Provider/MenuProvider.dart';
import 'package:proyectosoft/db/database.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/vistas/Home.dart';
import 'package:proyectosoft/widgets/add_button.dart';
import 'package:proyectosoft/widgets/custom_back_arrow.dart';

import '../Provider/UserProvider.dart';

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
            color: Palette.complement,
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
                      color: Palette.seccomponent),
                  SizedBox(
                    width: screenwidth * 0.1,
                  ),
                ],
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              SizedBox(
                height: screenheight * 0.8,
                width: screenwidth * 0.86,
                child: StreamBuilder<QuerySnapshot>(
                    stream: Database.readItems(
                        context.watch<MenuProvider>().opcion),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text(
                            'Hubo un error en la carga. Por favor intenta nuevamente en un rato');
                      } else if (snapshot.hasData || snapshot.data != null) {
                        return ListView.separated(
                            itemBuilder: ((context, index) {
                              var itemInfo = snapshot.data!.docs[index].data()!
                                  as Map<String, dynamic>;
                              String docID = snapshot.data!.docs[index].id;
                              String name = itemInfo['Nombre'];
                              String price = itemInfo['Precio'].toString();
                              String url = itemInfo['Img'];

                              return add_button(
                                  screenheight: screenheight,
                                  screenwidth: screenwidth,
                                  nombre: name,
                                  uid: context
                                      .watch<UserProvider>()
                                      .customUser
                                      .uid,
                                  precio: price,
                                  docId: docID,
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
                            Palette.primary,
                          ),
                        ),
                      );
                    }),
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
