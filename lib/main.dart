import 'package:flutter/material.dart';
import 'package:notas_flutter_firebase/pages/nueva_nota.dart';
import 'package:notas_flutter_firebase/pages/pages.dart';
import 'package:notas_flutter_firebase/values/tema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: miTema(context),
      title: 'Notas App',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/nuevaNota': (BuildContext context) => ModalNuevaNota(),
      },
    );
  }
}
