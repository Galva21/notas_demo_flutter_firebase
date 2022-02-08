import 'package:flutter/material.dart';
import 'package:notas_flutter_firebase/models/nota.dart';
import 'package:notas_flutter_firebase/values/tema.dart';

class HomePage extends StatelessWidget {

  List<Nota> misNotas = [
    Nota(titulo: "Titulo 1", contenido: "Contenido de la nota 1"),
    Nota(titulo: "Titulo 2", contenido: "Contenido de la nota 2"),
    Nota(titulo: "Titulo 3", contenido: "Contenido de la nota 3"),
    Nota(titulo: "Titulo 4", contenido: "Contenido de la nota 4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notas')),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return ModalNuevaNota();
            },
          );
        }),
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          for (Nota nota in misNotas)
          ListTile(
            title: Text(nota.titulo!),
            subtitle: Text(nota.contenido!),
          )
        ],
      )
    );
  }
}

class ModalNuevaNota extends StatefulWidget {
  @override
  State<ModalNuevaNota> createState() => _ModalNuevaNotaState();
}

class _ModalNuevaNotaState extends State<ModalNuevaNota> {
  final TextEditingController _tituloController = new TextEditingController();

  final TextEditingController _contenidoController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      color: blanco,
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: "Titulo de la nota",
              ),
            ),
            TextFormField(
              controller: _contenidoController,
              decoration: const InputDecoration(
                labelText: "Contenido",
              ),
              maxLines: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: (() {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Nota agregada correctamente"),
                      ),
                    );
                  }),
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
