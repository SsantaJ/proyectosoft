import 'dart:html';

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

/*
Text txt(String text, Color colr, double tam, String estilo) {
  return Text(text,
      style: TextStyle(
          fontSize: tam,
          fontWeight: FontWeight.w500,
          color: colr,
          fontFamily: estilo),
      textAlign: TextAlign.center);
}
*/
