import 'package:firebase_database/firebase_database.dart';
import 'package:notas_flutter_firebase/models/nota.dart';

class UserServices {
  Future<List<Nota>> getNotas() async {
    List<Nota> misNotas = [];
    try {
      DatabaseEvent db =
          await FirebaseDatabase.instance.ref().child('notes').once();
      dynamic snap = db.snapshot;
      if (snap.exists) {
        snap.value.forEach((key, value) {
          Map mapa = {'key': key, ...value};
          Nota nuevaNota = Nota(
              contenido: mapa['body'], key: mapa['key'], titulo: mapa['title']);
          misNotas.add(nuevaNota);
        });
      } else {
        print('no hay nada');
      }
      return misNotas;
    } catch (e) {
      return misNotas;
    }
  }

  Future<bool> saveNotas(String titulo, String contenido) async {
    try {
      await FirebaseDatabase.instance
          .ref()
          .child('notes')
          .push()
          .set({'title': titulo, 'body': contenido});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> eliminarNota(String? key) async {
    try {
      await FirebaseDatabase.instance.ref().child('notes').child(key!).remove();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
