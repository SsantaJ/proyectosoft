import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';
import 'package:provider/provider.dart';
import 'package:proyectosoft/db/database.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

import '../Provider/MenuProvider.dart';

class cart_card extends StatefulWidget {
  const cart_card({
    Key? key,
    required this.screenheight,
    required this.screenwidth,
    required this.nombre,
    required this.precio,
    required this.img,
    required this.docID,
    required this.can,
    required this.user,
  }) : super(key: key);

  final double screenheight, screenwidth;
  final String img, precio, nombre, docID, user;
  final int can;
  static const IconData trash = IconData(0xf4c4,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);
  @override
  State<cart_card> createState() => _cart_cardState();
}

class _cart_cardState extends State<cart_card> {
  @override
  Widget build(BuildContext context) {
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
              const Spacer(),
              CustomText(
                text: "Cantidad: " + widget.can.toString(),
                color: Palette.seccomponent,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Spacer(),
              CustomText(
                text: "Cantidad: " + widget.can.toString(),
                color: Palette.seccomponent,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Spacer(),
              CustomText(
                text: "\$" + widget.precio,
                color: Colors.green,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Spacer()
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Database.deleteItem(docId: widget.docID, usuario: widget.user);
              context.read<MenuProvider>().checkEmpty(uid: widget.user);
              context.read<MenuProvider>().calcSubTotal(uid: widget.user);
              final snackbar = SnackBar(
                  content: CustomText(
                      text: widget.nombre + " eliminado del carrito",
                      fontFamily: "Poppins",
                      fontSize: 12,
                      color: Palette.complement),
                  backgroundColor: Palette.primary);

              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(snackbar);
            },
            child: Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                  color: Palette.seccomponent,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                cart_card.trash,
                color: Palette.complement,
              ),
            ),
          )
        ],
      ),
    );
  }
}
