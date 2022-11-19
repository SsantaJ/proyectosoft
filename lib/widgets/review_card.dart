import 'package:flutter/material.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'custom_text.dart';

class review_card extends StatefulWidget {
  const review_card({
    Key? key,
    required this.screenheight,
    required this.screenwidth,
    required this.precio,
    required this.uid,
    required this.nombre,
    required this.url,
    required this.can,
  }) : super(key: key);

  final double screenheight, screenwidth;
  final String nombre, precio, url, uid;
  final int can;

  @override
  State<review_card> createState() => _review_cardState();
}

class _review_cardState extends State<review_card> {
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
                  widget.url,
                  fit: BoxFit.fitWidth,
                ),
              ),
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
                text: widget.nombre,
                color: Palette.seccomponent,
                fontSize: 14,
                fontFamily: "Poppins",
              ),
              Spacer(),
              CustomText(
                text: "Cantidad: " +
                    widget.can.toString(),
                color: Palette.seccomponent,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Spacer(),
              CustomText(
                text: "\$"+widget.precio,
                color: Colors.green,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }
}
