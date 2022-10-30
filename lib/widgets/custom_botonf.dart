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
  }) : super(key: key);
  final VoidCallback funcion;
  final String img;
  final Color color;
  final Color color2;
  final double x, y, border, tamimg;

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
          image:
              DecorationImage(image: AssetImage(widget.img), fit: BoxFit.cover),
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.border),
        ),
        /* child: Center(
          
            child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.tamtxt,
            fontWeight: FontWeight.w900,
            color: widget.color2,
          ),
        )), */
      ),
    );
  }
}
