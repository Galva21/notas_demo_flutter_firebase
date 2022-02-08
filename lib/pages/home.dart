import 'package:flutter/material.dart';
import 'package:notas_flutter_firebase/models/nota.dart';
import 'package:notas_flutter_firebase/services/appstate.dart';
import 'package:notas_flutter_firebase/services/userservices.dart';
import 'package:notas_flutter_firebase/values/tema.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppState? estado;
  @override
  Widget build(BuildContext context) {
    estado = Provider.of<AppState>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamed(context, 'nuevaNota');
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
        future: estado!.obtenerNotas(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List misnotas = snapshot.data ?? [];
          return ListView(
            children: [
              for (Nota nota in misnotas)
                ListTile(
                  title: Text(nota.titulo!),
                  subtitle: Text(nota.contenido!),
                  trailing: IconButton(
                    onPressed: () {
                      estado!.borrarNota(nota.key);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red.shade400,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
