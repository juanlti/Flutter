import 'package:flutter/material.dart';

class SliderScroolViewScreen extends StatefulWidget {
  const SliderScroolViewScreen({Key? key}) : super(key: key);

  @override
  State<SliderScroolViewScreen> createState() => _SliderScroolViewScreenState();
}

class _SliderScroolViewScreenState extends State<SliderScroolViewScreen> {
  double valorSlider = 200;

  bool cambiar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider'),
        ),
        body: Column(
          children: [
            Slider(
                label:
                    'estoy con los valores recondeados a 4 decimales ${valorSlider.roundToDouble()}',
                divisions: 10,
                min: 50,
                max: 1000,
                value: valorSlider,
                inactiveColor: Colors.red,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    if (cambiar) {
                      valorSlider = value;
                      print('valor de valorSlider = $valorSlider');
                    }
                  });
                }),
            SwitchListTile.adaptive(
                title: Text(
                    'se encuentra ${cambiar == true ? 'activo' : 'desactivado'}'),
                selected: true,
                value: cambiar,
                onChanged: (bool value) {
                  setState(() {
                    print('valores de $value');
                    cambiar = value;
                  });
                }),
            Expanded(
              child: Image(
                width: valorSlider,
                height: valorSlider,
                image: const NetworkImage(
                    'https://media.revistagq.com/photos/6050e0cc267aa4eef01d2e77/16:9/w_2560%2Cc_limit/henry-cavill-entrenamiento-superman.jpeg'),
              ),
            ),
          ],
        ));
  }
}
