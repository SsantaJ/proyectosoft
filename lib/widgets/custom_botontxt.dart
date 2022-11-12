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
