import 'package:flutter/material.dart';

class CustomWidgetType01 extends StatelessWidget {
  const CustomWidgetType01({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          //primera tarjeta
          const ListTile(
            leading: Icon(
              Icons.photo_album_outlined,
            ),
            title: Text(
                'Adipisicing aliquip ea excepteur deserunt dolor cupidatat irure dolore voluptate nulla sit. Aute laborum occaecat enim proident ut ullamco nisi aliquip. Cillum ea minim sit elit eu aliqua reprehenderit elit excepteur laborum nisi sunt occaecat commodo. Incididunt veniam ad ex ullamco ut. Aute mollit elit ad laborum laboris duis labore pariatur occaecat.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'ok',
                    )),
                TextButton(onPressed: () {}, child: const Text('cancel')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
