import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/Palette.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.obs,
    required this.text,
    required this.colorbg,
    required this.x,
    required this.y,
    required this.color,
    this.digit = false,
    required this.controlador,
  }) : super(key: key);

  final bool obs, digit;
  final String text;
  final Color? color, colorbg;
  final double x, y;
  final TextEditingController controlador;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    if(widget.digit){return SizedBox(
      width: widget.x,
      height: widget.y,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: widget.colorbg, borderRadius: BorderRadius.circular(30)),
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          controller: widget.controlador,
          obscureText: widget.obs,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular((30))),
              borderSide: BorderSide(color: Colors.black, width: 0.1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular((30))),
              borderSide: BorderSide(
                color: Palette.secondary,
                width: 2,
              ),
            ),
            iconColor: widget.color,
            labelText: widget.text,
            labelStyle: const TextStyle(
              color: Color.fromARGB(92, 61, 61, 61),
            ),
          ),
        ),
      ),
    );}
    return SizedBox(
      width: widget.x,
      height: widget.y,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: widget.colorbg, borderRadius: BorderRadius.circular(30)),
        child: TextField(
          controller: widget.controlador,
          obscureText: widget.obs,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular((30))),
              borderSide: BorderSide(color: Colors.black, width: 0.1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular((30))),
              borderSide: BorderSide(
                color: Palette.secondary,
                width: 2,
              ),
            ),
            iconColor: widget.color,
            labelText: widget.text,
            labelStyle: const TextStyle(
              color: Color.fromARGB(92, 61, 61, 61),
            ),
          ),
        ),
      ),
    );
  }
}
