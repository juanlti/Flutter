import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
            texto: 'General',
          ),
          _SingleCard(
            texto: 'Transporte',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            texto: 'Shopping',
          ),
          _SingleCard(
            texto: 'Bills',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            texto: 'Entertainment',
          ),
          _SingleCard(
            texto: 'Grocery',
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final String texto;

  const _SingleCard({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(62, 67, 107, 0.7),
        ),
        height: 180,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            maxRadius: 40,
            child: Icon(
              Icons.pie_chart_sharp,
              size: 50,
            ),
          ),
          SizedBox(height: 20),
          Text(
            texto,
            style: TextStyle(color: Colors.blueAccent, fontSize: 17),
          ),
        ]));
  }
}
