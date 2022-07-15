import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);
  //final fixedLengthList = List.filled(10, null,growable: false);
  final List<String> opt = const ['megan', 'metal', 'super', 'Fantasy'];
  final List<Icon> iconos = const [
    Icon(Icons.home),
    Icon(Icons.ac_unit),
    Icon(Icons.access_alarms_outlined),
    Icon(Icons.car_rental)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my titulo'),
      ),
      body: ListView(
        children: recorrer(),
      ),
    );
  }

  List<Widget> recorrer() {
    final List<Widget> lista = [];

    for (var i = 0; i < opt.length; i++) {
      final widgetTemp = ListTile(
        title: Text('${opt[i]}'),
        trailing: const Icon(Icons.navigate_next),
        leading: iconos[i],
      );
      lista.add(widgetTemp);
      lista.add(const Divider(
        thickness: 2.0,
        color: Colors.red,
      ));

      // print('cuando i=$i valor => ${opt[i]}');
    }

    lista.add(const Text('MIR4'));
    return lista;
  }
}
