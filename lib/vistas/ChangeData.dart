import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:proyectosoft/util/Palette.dart';
import 'package:proyectosoft/widgets/custom_text.dart';

import '../Provider/UserProvider.dart';

class ChangeData extends StatelessWidget {
  const ChangeData({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.complement,
      body: Column(
        children: [
          SizedBox(
            height: screenheight * 0.05,
          ),
          Container(
            alignment: Alignment.center,
            child: CustomText(
              text: "MODIFICAR USUARIO",
              fontFamily: Palette.font,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: screenheight * 0.05,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: CustomText(
                text: context.watch<UserProvider>().customUser.email.toString(),
                fontFamily: Palette.font,
                fontSize: 22,
                color: Palette.primary),
          )
        ],
      ),
    );
  }
}
