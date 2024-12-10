import 'package:doctor_app_template/notifier/theme_notifier.dart';
import 'package:doctor_app_template/screens/introduction_screen.dart';
import 'package:doctor_app_template/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
      ],
      builder: (context, child) => MaterialApp(
        title: 'App Doctor',

        /// quitar el banner de debug
        debugShowCheckedModeBanner: false,

        /// En sus casas aplicar la estrategia de rutas por nombre
        // home: IntroductionScreen(),

        routes: routes,
        initialRoute: IntroductionScreen.routeName,

        /// ThemeData
        theme: context.watch<ThemeNotifier>().isDark
            ? ThemeData.dark()
            : ThemeData.light(),
      ),
    );
  }
}
