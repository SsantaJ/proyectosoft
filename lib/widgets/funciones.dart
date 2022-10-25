import 'package:flutter/material.dart';

Text txt(String text, Color colr, double tam, String estilo) {
  return Text(text,
      style: TextStyle(
          fontSize: tam,
          fontWeight: FontWeight.w500,
          color: colr,
          fontFamily: estilo),
      textAlign: TextAlign.right);
}

GestureDetector boton(VoidCallback funcion, Color color, String text,
    Color colorl, double x, double y) {
  return GestureDetector(
    onTap: funcion,
    child: Container(
      width: x,
      height: y,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: colorl,
            width: 0.3,
          )),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          color: colorl,
        ),
      )),
    ),
  );
}



/*
SizedBox campo(String text, bool obs, Color color, double tam) {
  return SizedBox(
    width: tam,
    child: TextField(
      obscureText: obs,
      decoration: InputDecoration(
          //hintText: text,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular((50))),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular((50))),
            borderSide: BorderSide(color: Colors.yellow, width: 1),
          ),
          iconColor: color,
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.black,
          )),
    ),
  );
}
*/
