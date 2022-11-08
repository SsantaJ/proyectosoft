import 'package:flutter/material.dart';

class Custombotonf extends StatefulWidget {
  const Custombotonf({
    Key? key,
    required this.funcion,
    required this.color,
    required this.img,
    required this.color2,
    required this.x,
    required this.y,
    required this.border,
    required this.tamimg,
    required this.grosor,
  }) : super(key: key);
  final VoidCallback funcion;
  final String img;
  final Color color;
  final Color color2;
  final double x, y, border, tamimg, grosor;

  @override
  State<Custombotonf> createState() => _Custombotonfstate();
}

class _Custombotonfstate extends State<Custombotonf> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.funcion,
      child: Container(
        width: widget.x,
        height: widget.y,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.img)),
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.border),
        ),
      ),
    );
  }
}
