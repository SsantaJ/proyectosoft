import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomBackArrow extends StatefulWidget {
  const CustomBackArrow({Key? key,
  
  required this.funcion,
  required this.dir,
  required this.color,
  
  }) : super(key: key);

  final VoidCallback funcion;
  final bool dir;
  final Color color;

  @override
  State<CustomBackArrow> createState() => _CustomBackArrowState();
}

class _CustomBackArrowState extends State<CustomBackArrow> {
  @override
  Widget build(BuildContext context) {
    double escala = 0;
    if(widget.dir == true){
      escala = 1;
    }
    else if(widget.dir == false){
      escala = -1;
    }
    return GestureDetector(
      onTap: widget.funcion,
      child: Transform.scale(
        scale: escala,
        child: Icon(Icons.arrow_back_ios, color: widget.color,),
      )
    );
  }
}
