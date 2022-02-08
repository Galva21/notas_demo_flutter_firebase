import 'package:flutter/material.dart';

Color primary = Color(0xff4059ad);
Color secondary = Color(0xff6b9ac4);
Color green = Color(0xff97d8c4);
Color blanco = Color(0xffeff2f1);
Color yellow = Color(0xfff4b942);

ThemeData miTema(BuildContext context){
  return ThemeData(
    primaryColor: primary,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue
    ).copyWith(
      secondary: Colors.amber
    )
  );
}