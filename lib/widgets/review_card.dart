import 'package:flutter/material.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'custom_text.dart';

class review_card extends StatefulWidget {
  const review_card({
    Key? key,
    required this.screenheight,
    required this.screenwidth,
  }) : super(key: key);

  final double screenheight, screenwidth;

  @override
  State<review_card> createState() => _review_cardState();
}

class _review_cardState extends State<review_card> {
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
                color: Palette.seccomponent,
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
          )
        ],
      ),
    );
  }
}
