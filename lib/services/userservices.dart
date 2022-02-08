import 'package:notas_flutter_firebase/models/nota.dart';

class UserServices {
  Future<List<Nota>> getNotas() async {
    List<Nota> misNotas = [
      Nota(titulo: "Titulo 1", contenido: "Contenido de la nota 1"),
      Nota(titulo: "Titulo 2", contenido: "Contenido de la nota 2"),
      Nota(titulo: "Titulo 3", contenido: "Contenido de la nota 3"),
      Nota(titulo: "Titulo 4", contenido: "Contenido de la nota 4"),
    ];

    return misNotas;
  }

  saveNotas(String titulo, String contenido) {}
}
