import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class cart_card extends StatefulWidget {
  const cart_card({
    Key? key,
    required this.screenheight,
    required this.screenwidth,
    required this.Nombre,
    required this.Precio,
    required this.Img,
  }) : super(key: key);

  final double screenheight, screenwidth;
  final String Img, Precio, Nombre;
  static const IconData trash = IconData(0xf4c4, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage);
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
                  widget.Img,
                  fit: BoxFit.fitWidth,
                ),
              )
          ),
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
                text: widget.Nombre,
                color: Palette.seccomponent,
                fontSize: 14,
                fontFamily: "Poppins",
              ),
              Flexible(child: Container()),
              CustomText(
                text: "\$"+widget.Precio,
                color: Colors.green,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Flexible(child: Container())
            ],
          ),
          Flexible(child: Container()),
          GestureDetector(
            onTap: () {},
            child: Icon(cart_card.trash, color: Palette.seccomponent,),
          )
        ],
      ),
    );
  }
}
