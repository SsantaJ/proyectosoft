import 'package:flutter/material.dart';

/*(VoidCallback funcion, Color color, String text,
    Color colorl, double x, double y, double tamtxt, double Border)*/

class Custombotontxt extends StatefulWidget {
  const Custombotontxt({
    Key? key,
    required this.funcion,
    required this.color,
    required this.text,
    required this.color2,
    required this.x,
    required this.y,
    required this.border,
    required this.tamtxt,
  }) : super(key: key);
  final VoidCallback funcion;
  final String text;
  final Color color;
  final Color color2;
  final double x, y, border, tamtxt;

  @override
  State<Custombotontxt> createState() => _Custombotontxtstate();
}

/*
{
  return GestureDetector(
    onTap: funcion,
    child: Container(
      width: x,
      height: y,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Border),
        /* border: Border.all(
            color: colorl,
            width: 0.3,
          ) */
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          fontSize: tamtxt,
          fontWeight: FontWeight.w900,
          color: colorl,
        ),
      )),
    ),
  );
}
*/
class _Custombotontxtstate extends State<Custombotontxt> {
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
            child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.tamtxt,
            fontWeight: FontWeight.w900,
            color: widget.color2,
          ),
        )),
      ),
    );
  }
}
