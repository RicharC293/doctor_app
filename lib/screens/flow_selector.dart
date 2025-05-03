import 'package:doctor_app_template/screens/introduction_screen.dart';
import 'package:doctor_app_template/screens/introduction_screen_morphr.dart';
import 'package:flutter/material.dart';

class FlowSelector extends StatelessWidget {
  const FlowSelector({super.key});

  static const String routeName = "/flow_selector";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        FilledButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              IntroductionScreen.routeName,
            );
          },
          child: Text("Code"),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              IntroductionScreenMorphr.routeName,
            );
          },
          child: Text("Morphr"),
        ),
      ],
    );
  }
}
