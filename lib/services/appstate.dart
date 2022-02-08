import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:notas_flutter_firebase/models/nota.dart';
import 'package:notas_flutter_firebase/services/userservices.dart';

class AppState with ChangeNotifier {
  List<Nota> misNotas = [];

  Future<bool> saveNota(String titulo, String contenido) async {
    try {
      bool resp = await UserServices().saveNotas(
        titulo,
        contenido,
      );
      if (resp) {
        notifyListeners();
      }
      return resp;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Nota>> obtenerNotas() async {
    try {
      misNotas = await UserServices().getNotas();
      return misNotas;
    } catch (e) {
      return misNotas;
    }
  }

  Future<void> borrarNota(String? key) async{
    try {
      bool resp = await UserServices().eliminarNota(key);
      if (resp) {
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
