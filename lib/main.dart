import 'package:doctor_app_template/notifier/theme_notifier.dart';
import 'package:doctor_app_template/screens/flow_selector.dart';
import 'package:doctor_app_template/screens/introduction_screen.dart';
import 'package:doctor_app_template/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:morphr/morphr.dart';

import 'morphr_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Morphr with your configuration
  await MorphrService.instance.initializeCloud(options: morphrOptions);

  runApp(const MyApp());
}

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
        initialRoute: FlowSelector.routeName,

        /// ThemeData
        theme: context.watch<ThemeNotifier>().isDark
            ? ThemeData.dark()
            : ThemeData.light(),
      ),
    );
  }
}
