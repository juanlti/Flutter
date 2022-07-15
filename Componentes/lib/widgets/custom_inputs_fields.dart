import 'package:flutter/material.dart';

class CustomInputsField extends StatelessWidget {
  const CustomInputsField({
    Key? key,
    this.dato1,
    this.dato2,
    this.tecladEmail,
    this.icono,
    required this.storageGlobal,
    required this.valueCurrent,
  }) : super(key: key);
  final String? dato1;
  final String? dato2;
  final TextInputType? tecladEmail;
  final Icon? icono;
  final String valueCurrent;
  final Map<String, String> storageGlobal;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: tecladEmail,
      showCursor: true,
      onChanged: (value) {
        print('valor ingresado $value');
      },
      validator: methodValidator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          //'Ejemplo: $dato1',
          helperText: 'Ejemplo: ${dato1 == null ? 'cosa nula' : dato1}',
          hintText: 'Ingrese su ${dato2 == null ? 'cosa nula' : dato2}',
          suffixIcon: icono == null
              ? const Icon(Icons.ac_unit)
              : Icon(icono as IconData),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(color: Colors.black, fontSize: 20),
    );
  }

  String? methodValidator(value) {
    print('valor primero de valorActual => $valueCurrent');
    switch (value) {
      case 1:
        if (storageGlobal[valueCurrent] == 'clave') {
          print('estoy en clave');
        }

        break;
      case 2:
        if (storageGlobal[valueCurrent] == 'email') {
          return ('estoy en email');
        }

        break;

      default:
        break;
    }

    if (value == null) {
      return ('Este campo es requerido');
    } else {
      if (value.length < 3) {
        return 'debe ser mayor a 3 letras';
      }
    }
    print('voy escribindo  $value');
    storageGlobal[valueCurrent] = value;
    print('valor despues de valorActual => $valueCurrent');
  }
}
