import 'package:flutter/material.dart';


class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: const Text('2323'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('esta es mi dialogo'),
                Icon(Icons.alternate_email),
                Divider(
                  color: Colors.red,
                ),
                Text('esta es mi dialogo'),
                Icon(Icons.alternate_email),
                Divider(
                  color: Colors.red,
                ),
                Text(
                    'esta es mi dialogoddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
                Icon(Icons.alternate_email),
                Divider(
                  color: Colors.red,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('volver')),
              //avatar_screen
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'avatar_screen');
                  },
                  child: const Text('viajar a otra pantalla')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              displayDialog(context);
            },
            child: const Text(
              'Mostrar Alerta',
              style: TextStyle(fontSize: 15),
            )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // .pop => devuelve la ultima pantalla.
        Navigator.pop(context);
      }),
    );
  }
}
