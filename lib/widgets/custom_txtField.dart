import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.obs, //OPCIONAL
    required this.text,
    required this.x,
    required this.y,
    required this.color, 
  }) : super(key: key);

  final bool obs; //puede ser nulla
  final String text;
  final Color? color; 
  final double x, y;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextField(
          obscureText: widget.obs,
          
          
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular((10))),
              borderSide: BorderSide(color: Colors.black, width: 0.1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular((10))),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 235, 165, 3), width: 2),
            ),
            iconColor: widget.color,
            labelText: widget.text,
            labelStyle: TextStyle(
              color: Color.fromARGB(92, 61, 61, 61),
            ),
            
          ),
        ),
      ),
    );
  }
}
