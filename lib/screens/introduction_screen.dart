import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Don't waste your time.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff606060),
                ),
              ),
              const Text(
                "Make an doctor Appointment",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff62C6FF),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Image.asset("assets/images/doctor.png"),
              ),
              FilledButton(
                onPressed: () {},
                child: Text("Let’s start"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
