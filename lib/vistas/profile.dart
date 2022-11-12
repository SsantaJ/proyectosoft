import 'package:flutter/material.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: screenwidth,
          height: screenheight,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: (screenheight * 0.045),
              ),
              Container(
                height: screenheight * 0.2,
                width: screenheight * 0.2,
                /* child: Image.network(
                  "https://static-cdn.jtvnw.net/jtv_user_pictures/2507d5ab-22ce-4f7e-8f38-ccefce4e5aac-profile_image-150x150.png",
                  height: screenheight * 0.3,
                ), */
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.pink[50],
                ),
              ),
              const CustomText(
                text: "USER",
                fontFamily: "Poppins",
                fontSize: 20,
                color: Colors.black,
              ),
              const Text(
                "+57 3218759535",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Poppins"),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
