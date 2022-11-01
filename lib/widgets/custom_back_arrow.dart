import 'package:flutter/cupertino.dart';
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
    return GestureDetector(
      onTap: widget.funcion,
    );
  }
}
