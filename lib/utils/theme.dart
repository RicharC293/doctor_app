import 'package:flutter/material.dart';

/// https://pub.dev/packages/google_fonts -> Google Fonts -> Roboto
final theme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xffFFFFFF),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Color(0xffFEA725)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  ),

  /// Editar las propiedades del divider
  // dividerTheme: DividerThemeData(
  //   color: Colors.red,
  // )

  /// Actualizar los temas de los textos
  // textTheme: TextTheme(
  // ),
);
