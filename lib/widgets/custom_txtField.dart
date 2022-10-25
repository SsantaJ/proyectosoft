import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.obs, //OPCIONAL
    required this.text,
    required this.x,
    required this.y,
    required this.color, 
  }) : super(key: key);

  final bool? obs; //puede ser nulla
  final String text;
  final Color? color; 
  final double x, y;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obs!,
      decoration: InputDecoration(
        //hintText: text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular((50))),
          borderSide: BorderSide(color: Colors.black, width: 0.1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular((50))),
          borderSide:
              BorderSide(color: Color.fromARGB(255, 235, 165, 3), width: 2),
        ),
        iconColor: color,
        labelText: text,
        labelStyle: TextStyle(
          color: Color.fromARGB(92, 61, 61, 61),
        ),
      ),
    );
  }
}
