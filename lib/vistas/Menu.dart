import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/db/database.dart';
import 'package:proyectosoft/util/Palette.dart';
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
                height: screenheight * 0.03,
              ),
              SizedBox(height: screenheight*0.8414, width: screenwidth * 0.86, child: StreamBuilder<QuerySnapshot>(stream: Database.readItems(),builder: (context, snapshot){
                if(snapshot.hasError){
                  return const Text(
                    'Hubo un error en la carga. Por favor intenta nuevamente en un rato');
                }
                else if(snapshot.hasData || snapshot.data != null){
                  return ListView.separated(itemBuilder: ((context, index) {
                    var itemInfo = snapshot.data!.docs[index].data()!
                    as Map<String, dynamic>;
                    String docId = snapshot.data!.docs[index].id;
                    String Name = itemInfo['Nombre'];
                    String Price = itemInfo['Precio'].toString();
                    String Url = itemInfo['Img'];
                    
                    return add_button(screenheight: screenheight, screenwidth: screenwidth, Nombre: Name, Precio: Price, Img: Url);
                  }), separatorBuilder: ((context, index) => const SizedBox(height: 16,)), itemCount: snapshot.data!.docs.length);
                }
               return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Palette.primary,
                  ),
                ),
              );
              }
              ),),
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
