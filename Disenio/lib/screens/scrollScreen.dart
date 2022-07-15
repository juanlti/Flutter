import 'package:flutter/material.dart';

class ScrollScreens extends StatelessWidget {
  const ScrollScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Page01(),
        Page02(),
      ],
    ));

    /*
        return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/scroll-1.png"),
        fit: BoxFit.cover,
      )),
    );
    */
  }
}

class Page01 extends StatelessWidget {
  const Page01({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/scroll-1.png",
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      MainContent()
    ]);
  }
}

class MainContent extends StatelessWidget {
  MainContent({
    Key? key,
  }) : super(key: key);
  final TextStyle textStyle =
      TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '11°',
            style: textStyle,
          ),
          Text(
            'Miercoles',
            style: textStyle,
          ),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_down,
            size: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class Page02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Center(
        child: TextButton(
            style: TextButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )),
      ),
    );
  }
}
