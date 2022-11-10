import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class add_button extends StatefulWidget {
  const add_button(
      {Key? key,
      required this.screenheight,
      required this.screenwidth,
      required this.Nombre,
      required this.Precio,
      required this.Img})
      : super(key: key);

  final double screenheight, screenwidth;
  final String Nombre, Precio, Img;
  @override
  State<add_button> createState() => _add_buttonState();
}

class _add_buttonState extends State<add_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenheight * 0.11,
      width: widget.screenwidth * 0.86,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: widget.screenwidth * 0.24,
            child: ClipRRect(borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.Img,
              fit: BoxFit.fitWidth,
            ),)
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
                color: Colors.white,
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
            child: Image.asset('assets/imgs/Add.png'),
          )
        ],
      ),
    );
  }
}
