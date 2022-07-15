import 'package:flutter/material.dart';

class CustomCardType02Screen extends StatelessWidget {
  const CustomCardType02Screen({Key? key, required this.urlImagen})
      : super(key: key);
  final String? urlImagen;
  @override
  Widget build(BuildContext context) {
    final firstHalf = Duration(seconds: 45); // 00:45:00.000000
    return Card(
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/image/jar-loading.gif'),
              image: NetworkImage(urlImagen ?? 'no hay imagen'),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              fadeOutDuration: const Duration(seconds: 3),
              fadeInDuration: const Duration(seconds: 3),
              placeholderFit: BoxFit.cover,
            ),
            if (urlImagen != null)
              Container (
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
                child: const Text('Un hermoso paisaje'),
              ),
          ],
        ));
  }
}
