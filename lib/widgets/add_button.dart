import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proyectosoft/db/database.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class add_button extends StatefulWidget {
  const add_button(
      {Key? key,
      required this.screenheight,
      required this.screenwidth,
      required this.nombre,
      required this.precio,
      required this.uid,
      required this.docId,
      required this.img})
      : super(key: key);

  final double screenheight, screenwidth;
  final String nombre, precio, img, uid, docId;
  @override
  State<add_button> createState() => _add_buttonState();
}

class _add_buttonState extends State<add_button> {
  @override
  Widget build(BuildContext context) {
    int can = 0;
    bool Added = false;
    return Container(
      height: widget.screenheight * 0.11,
      width: widget.screenwidth * 0.86,
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
              width: widget.screenwidth * 0.24,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.img,
                  fit: BoxFit.fitWidth,
                ),
              )),
          SizedBox(
            width: widget.screenwidth * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: widget.screenheight * 0.02,
              ),
              CustomText(
                text: widget.nombre,
                color: Palette.seccomponent,
                fontSize: 14,
                fontFamily: "Poppins",
              ),
              Spacer(),
              CustomText(
                text: "\$${widget.precio}",
                color: Colors.green,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Spacer()
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (!Added) {
                Database.addItem(
                    Img: widget.img,
                    Precio: widget.precio,
                    Nombre: widget.nombre,
                    usuario: widget.uid);
                Added = true;
                can = 1;
              }
              if (Added) {
                can++;
                Database.updateItem(
                    Img: widget.img,
                    Precio: widget.precio,
                    Nombre: widget.nombre,
                    usuario: widget.uid,
                    Cantidad: can,
                    docId: widget.docId);
              }
              final snackbar = SnackBar(
                  content: CustomText(
                      text: widget.nombre + " añanido al carrito",
                      fontFamily: "Poppins",
                      fontSize: 12,
                      color: Palette.complement),
                  backgroundColor: Palette.primary);

              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(snackbar);
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: Palette.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
