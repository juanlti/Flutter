import 'package:flutter/material.dart';

class ListView1Screen2 extends StatelessWidget {
  const ListView1Screen2({Key? key}) : super(key: key);
  //final fixedLengthList = List.filled(10, null,growable: false);
  final List<String> opt = const [
    'megan',
    'metal',
    'super',
    'Fantasy',
    'metal',
  ];
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
      body: ListView.separated(
        itemCount: opt.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(opt[index]),
          );
        },
        separatorBuilder: (_, __) => const Divider(
          thickness: 5.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
