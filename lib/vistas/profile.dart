import 'package:flutter/material.dart';

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
            color: Color.fromARGB(255, 75, 109, 184),
          ),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
