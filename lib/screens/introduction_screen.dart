import 'package:doctor_app_template/screens/home_screen.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  static const routeName = "/introduction";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Widget 1
              const Text(
                "Don't waste your time.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff606060),
                ),
              ),

              const SizedBox(height: 24),

              /// Widget 2
              const Text(
                "Make an doctor Appointment",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),

              const SizedBox(height: 24),

              /// Widget 3
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        /// Opacidad -> .withOpacity
                        color: const Color(0xff62C6FF).withOpacity(0.17),
                        blurRadius: 100,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/doctor.png",

                        /// Pruebas -> adaptar el tamaño de la imagen
                        // width: MediaQuery.of(context).size.width > 320
                        //     ? 600
                        //     : MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      const Divider(height: 0),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Widget 4
              SizedBox(
                // double.infinity -> 100% | padre |
                width: double.infinity,
                height: 60,
                child: FilledButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, HomeScreen.routeName);

                    /// Reemplazar la pantalla
                    /// pushReplacementNamed -> push otra pantalla
                    /// Reemplazar la pantalla de origen por el destino
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);

                    /// No solo 1 pantalla
                    /// IntroductionScreen    /// HomeScreen
                    /// LoginScreen           
                    /// ForgotPasswordScreen
                    /// CodeVerificationScreen
                  
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => route.isCurrent,
                    );

                    ///  route.isActive -> si la ruta está activa
                    ///  route.isCurrent -> si la ruta es la actual
                    /// route.isFirst -> si la ruta es la primera
                    

                    /// LoginScreen -> context
                    /// context -> ModalRecuperarContrasena 
          
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll(Color(0xffFEA725)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Let's start",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
