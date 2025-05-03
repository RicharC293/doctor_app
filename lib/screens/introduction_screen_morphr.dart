import 'package:flutter/material.dart';
import 'package:morphr/components/figma_component.dart';

import 'home_screen.dart';

class IntroductionScreenMorphr extends StatelessWidget {
  const IntroductionScreenMorphr({super.key});

  static const String routeName = "/introduction_screen_morphr";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              const FigmaComponent.text(
                "Don’t waste your time.",
                text: "Don’t waste your time.",
              ),
              const FigmaComponent.text(
                "Make an doctor Appointment",
                text: "Make an doctor Appointment",
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const FigmaComponent.container(
                    "Ellipse 231",
                  ),
                  Image.asset(
                    "assets/images/doctor.png",
                    height: MediaQuery.of(context).size.height * 0.4,
                  )
                ],
              ),
              Center(
                child: FigmaComponent.button(
                  "Frame 1465",
                  child: const Center(
                    child: FigmaComponent.text(
                      "Let’s start",
                      text: "Let’s start",
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => route.isCurrent,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
