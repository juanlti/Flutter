import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                //       begin: Alignment.topCenter, sirve para cambiar la orientacion
                begin: Alignment.topCenter,

                //  end: Alignment.center,
                //end: Alignment.center,
                colors: [
              Colors.blue,
              Colors.blueGrey,
            ])),
      ),

    ]);
  }
}
