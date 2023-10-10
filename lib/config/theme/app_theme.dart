

import 'package:flutter/material.dart';


const seedColor = Color.fromARGB(255, 7, 80, 59);
const niceColor = Color(0xFF3498db);

class AppTheme {

  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: niceColor,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,

    listTileTheme: const ListTileThemeData(
      iconColor: niceColor,
    ),

  );

}