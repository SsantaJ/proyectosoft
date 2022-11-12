import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class Custombotonf extends StatefulWidget {
  const Custombotonf(
      {Key? key,
      required this.funcion,
      required this.color,
      required this.img,
      required this.color2,
      required this.x,
      required this.y,
      required this.border,
      required this.tamimg,
      required this.grosor,
      required this.text})
      : super(key: key);
  final VoidCallback funcion;
  final String img, text;
  final Color color;
  final Color color2;
  final double x, y, border, tamimg, grosor;

  @override
  State<Custombotonf> createState() => _Custombotonfstate();
}

class _Custombotonfstate extends State<Custombotonf> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
            text: widget.text,
            fontFamily: "Poppins",
            fontSize: 15,
            color: Colors.white),
        GestureDetector(
          onTap: widget.funcion,
          child: Container(
            width: widget.x,
            height: widget.y,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.img), scale: widget.tamimg),
              color: widget.color,
              borderRadius: BorderRadius.circular(widget.border),
              border: Border.all(
                color: widget.color2,
                width: widget.grosor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
