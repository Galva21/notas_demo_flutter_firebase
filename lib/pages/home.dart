import 'package:flutter/material.dart';
import 'package:notas_flutter_firebase/models/nota.dart';
import 'package:notas_flutter_firebase/services/userservices.dart';
import 'package:notas_flutter_firebase/values/tema.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notas')),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamed(context, '/nuevaNota');
          // showModalBottomSheet(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return ModalNuevaNota();
          //   },
          // );
        }),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: UserServices().getNotas(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List misnotas = snapshot.data ?? [];
          return ListView(
            children: [
              for (Nota nota in misnotas)
                ListTile(
                  title: Text(nota.titulo!),
                  subtitle: Text(nota.contenido!),
                )
            ],
          );
        },
      ),
    );
  }
}
