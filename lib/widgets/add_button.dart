import 'package:flutter/material.dart';
import 'package:proyectosoft/db/database.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class add_button extends StatefulWidget {
  const add_button(
      {Key? key,
      required this.screenheight,
      required this.screenwidth,
      required this.nombre,
      required this.precio,
      required this.img})
      : super(key: key);

  final double screenheight, screenwidth;
  final String nombre, precio, img;
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
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Poppins",
              ),
              Flexible(child: Container()),
              CustomText(
                text: "\$${widget.precio}",
                color: Colors.green,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Flexible(child: Container())
            ],
          ),
          Flexible(child: Container()),
          GestureDetector(
            onTap: () {
              Database.addItem(Img: widget.img, Precio: widget.precio, Nombre: widget.nombre);
            },
            child: Image.asset('assets/imgs/Add.png'),
          )
        ],
      ),
    );
  }
}
