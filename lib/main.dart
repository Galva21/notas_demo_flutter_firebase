import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notas_flutter_firebase/pages/nueva_nota.dart';
import 'package:notas_flutter_firebase/pages/pages.dart';
import 'package:notas_flutter_firebase/services/appstate.dart';
import 'package:notas_flutter_firebase/values/tema.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => AppState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema(context),
        title: 'Notas App',
        home: HomePage(),
        routes: <String, WidgetBuilder>{
          'nuevaNota': (_) => ModalNuevaNota(),
        },
      ),
    );
  }
}
