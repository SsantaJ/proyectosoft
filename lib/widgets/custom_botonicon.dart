import 'package:flutter/material.dart';

/*(VoidCallback funcion, Color color, String text,
    Color colorl, double x, double y, double tamtxt, double Border)*/

class Custombotonicon extends StatefulWidget {
  const Custombotonicon({
    Key? key,
    required this.funcion,
    required this.color,
    required this.color2,
    required this.x,
    required this.y,
    required this.border,
    required this.tamtxt,
    required this.icono,
  }) : super(key: key);
  final VoidCallback funcion;
  final Color color;
  final Color color2;
  final double x, y, border, tamtxt;
  final IconData icono;

  @override
  State<Custombotonicon> createState() => _Custombotoniconstate();
}

class _Custombotoniconstate extends State<Custombotonicon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.funcion,
      child: Container(
        width: widget.x,
        height: widget.y,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.border),
          /* border: Border.all(
            color: colorl,
            width: 0.3,
          ) */
        ),
        child: Center(
            child: Icon(
          widget.icono,
          color: widget.color2,
        )),
      ),
    );
  }
}
