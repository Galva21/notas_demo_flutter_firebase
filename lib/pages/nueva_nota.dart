import 'package:flutter/material.dart';
import 'package:notas_flutter_firebase/services/userservices.dart';
import 'package:notas_flutter_firebase/values/tema.dart';

class ModalNuevaNota extends StatefulWidget {
  @override
  State<ModalNuevaNota> createState() => _ModalNuevaNotaState();
}

class _ModalNuevaNotaState extends State<ModalNuevaNota> {
  final TextEditingController _tituloController = new TextEditingController();
  final TextEditingController _contenidoController =
      new TextEditingController();
  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        color: blanco,
        child: Form(
          key: _formularioKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _tituloController,
                  decoration: const InputDecoration(
                    labelText: "Titulo de la nota",
                  ),
                  validator: (String? dato) {
                    if (dato!.isEmpty) {
                      return 'Este campo es requerido';
                    }
                  },
                ),
                TextFormField(
                  controller: _contenidoController,
                  decoration: const InputDecoration(
                    labelText: "Contenido",
                  ),
                  maxLines: 10,
                  validator: (String? dato) {
                    if (dato!.isEmpty) {
                      return 'Este campo es requerido';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formularioKey.currentState!.validate()) {
                          bool respuesta = await UserServices().saveNotas(
                            _tituloController.text,
                            _contenidoController.text,
                          );

                          if (respuesta) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Nota agregada correctamente'),
                              backgroundColor: Colors.green,
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text('Hubo un problema al agregar la nota'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }
                      },
                      child: Text('Aceptar'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: Text('Cancelar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _contenidoController.dispose();
    _tituloController.dispose();
    super.dispose();
  }
}
