import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class Custombotonf extends StatefulWidget {
  const Custombotonf(
      {Key? key,
      required this.funcion,
      required this.color,
      required this.img,
      required this.color2,
      required this.x,
      required this.y,
      required this.border,
      required this.tamimg,
      required this.grosor,
      required this.ax,
      required this.ay,
      required this.text})
      : super(key: key);
  final VoidCallback funcion;
  final String img, text;
  final Color color;
  final Color color2;
  final double x, y, border, tamimg, grosor, ax, ay;

  @override
  State<Custombotonf> createState() => _Custombotonfstate();
}

class _Custombotonfstate extends State<Custombotonf> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        GestureDetector(
          onTap: widget.funcion,
          child: Container(
            width: widget.x,
            height: widget.y,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.img),
                scale: widget.tamimg,
                alignment: Alignment(widget.ax, widget.ay),
              ),
              color: widget.color,
              borderRadius: BorderRadius.circular(widget.border),
              border: Border.all(
                color: widget.color2,
                width: widget.grosor,
              ),
            ),
            alignment: const Alignment(-0.7, 1),
            /*Align(
            alignment: const Alignment(-1, 1),
            child: Image.asset(
              fit: BoxFit.cover,
              "assets/imgs/platofondo.png",
              height: screenheight * 0.35,
              scale: 0.1,
            ),
          ),*/
            child: Column(
              children: [
                SizedBox(
                  height: screenheight * 0.013,
                ),
                /* SizedBox(
                  width: screenwidth * 0.02,
                ), */
                CustomText(
                    text: widget.text,
                    fontFamily: "Poppins",
                    fontSize: 12,
                    color: widget.color2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
