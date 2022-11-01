import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class add_button extends StatefulWidget {
  const add_button({
    Key? key,
    required this.screenheight,
    required this.screenwidth,
  }) : super(key: key);

  final double screenheight, screenwidth;
  @override
  State<add_button> createState() => _add_buttonState();
}

class _add_buttonState extends State<add_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenheight * 0.11,
      width: widget.screenwidth * 0.86,
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            width: widget.screenwidth * 0.24,
            child: Image.asset(
              "assets/imgs/placeholder-carrito.png",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: widget.screenwidth * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: widget.screenheight * 0.02,
              ),
              const CustomText(
                text: "Comida muy rica",
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Poppins",
              ),
              Flexible(child: Container()),
              const CustomText(
                text: "\$99.99",
                color: Colors.green,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              Flexible(child: Container())
            ],
          ),
          Flexible(child: Container()),
          GestureDetector(
            onTap: () {},
            child: Image.asset('assets/imgs/Add.png'),
          )
        ],
      ),
    );
  }
}
