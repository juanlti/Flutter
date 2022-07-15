import 'package:componentes/widgets/custom_inputs_fields.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    const TextInputType tecladoEmail = TextInputType.emailAddress;
    final Map<String, String> formValues = {
      'first_name': 'Juan Cruz',
      'last_name': 'Barrera Liberati',
      'email': 'juancruzliberati@hotmil.com',
      'clave': '12314@Lm',
      'confirmacionClave': '12314@Lm0',
      'rol': 'Admin',
    };
    print('vacio $formValues');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              CustomInputsField(
                dato1: 'Maria',
                dato2: 'Nombre',
                storageGlobal: formValues,
                valueCurrent: 'first_name',
              ),
              CustomInputsField(
                dato1: 'Perez',
                dato2: 'Apellido',
                storageGlobal: formValues,
                valueCurrent: 'last_name',
              ),
              CustomInputsField(
                dato1: 'mariaPerez@gmail.com',
                dato2: 'email',
                tecladEmail: tecladoEmail,
                icono: null,
                storageGlobal: formValues,
                valueCurrent: 'email',
              ),
              CustomInputsField(
                dato1: '1234@Lm',
                dato2: 'clave',
                storageGlobal: formValues,
                valueCurrent: 'clave',
              ),
              CustomInputsField(
                dato1: '1234@Lm',
                dato2: 'vuelva a ingresar su clave',
                storageGlobal: formValues,
                valueCurrent: 'confirmacionClave',
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        //FocusScope.of(context).requestFocus(FocusNode());
                        FocusManager.instance.primaryFocus?.unfocus();

                        if (myFormKey.currentState!.validate()) {
                          Exception('erorr');
                        } else {
                          Exception('erorr2323');
                        }
                      },
                      child: const Text('Guardar'))),
            ],
          ),
        ),
      )),
    );
  }
}
