import 'dart:convert';

import 'package:flutter/material.dart';

class BasicDesingScren extends StatelessWidget {
  const BasicDesingScren({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/landsscape01.jpg')),
          Ttitle(),
          Buttons(),
          TextInformation(),
        ],
      ),
    );
  }
}

class TextInformation extends StatelessWidget {
  const TextInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Text(
          'Id enim incididunt consequat minim in. Tempor id amet nulla dolor ex non est aliqua non. Consectetur aliquip veniam deserunt fugiat nulla reprehenderit. Reprehenderit sint laboris sint id labore do aute sunt pariatur. Duis irure laborum sint amet.'),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ColumnGeneral(
            text: Text('Call'),
            icono: Icon(Icons.call),
          ),
          ColumnGeneral(
            text: Text('Routes'),
            icono: Icon(Icons.map_sharp),
          ),
          ColumnGeneral(
            text: Text('Share'),
            icono: Icon(Icons.share),
          ),
        ],
      ),
    );
  }
}

class ColumnGeneral extends StatelessWidget {
  final Icon icono;
  final Text text;
  const ColumnGeneral({
    Key? key,
    required this.icono,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icono,
        text,
      ],
    );
  }
}

class Ttitle extends StatelessWidget {
  const Ttitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Oeschinen Lake Campground',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Expanded(child: Container()),
        const Icon(Icons.star),
        const Text('41')
      ]),
    );
  }
}
