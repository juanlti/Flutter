import 'package:componentes/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          CustomWidgetType01(),
          SizedBox(height: 10),
          CustomCardType02Screen(
            urlImagen:
                'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg',
          ),
          SizedBox(height: 10),
          CustomCardType02Screen(
            urlImagen:
                'https://lh3.googleusercontent.com/f6g4gs7tFgv-3bH7fPAQcoydPVjqqMAmGCC5Q3L6jnfrgbNHg1jDQZIrhyEC66rUPxJjxMsrMic-TnEzQ1x-_gea_I3d3pNRmN1w9U-vEXZcsn68Nqj8KowVgXIfTRqwkaUkpok',
          ),
          SizedBox(height: 10),
          CustomCardType02Screen(
            urlImagen: 'https://i.ytimg.com/vi/yDiD8F9ItX0/maxresdefault.jpg',
          ),
          SizedBox(height: 10),
          CustomCardType02Screen(
            urlImagen:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR_Vch_D8rRWVmSZQX6R_eOnBL7eT9yBHCCA&usqp=CAU',
          ),
          SizedBox(height: 10),
          CustomCardType02Screen(
            urlImagen:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6MG2lQlp8Xm_44UOoY2uQ4ywki7hbzuYYpg&usqp=CAU',
          ),
        ],
      ),
    );
  }
}
