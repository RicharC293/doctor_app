import 'package:doctor_app_template/screens/home_screen.dart';
import 'package:doctor_app_template/screens/introduction_screen.dart';
import 'package:doctor_app_template/screens/reservation_screen.dart';

final routes = {
  IntroductionScreen.routeName: (context) => const IntroductionScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ReservationScreen.routeName: (context) => const ReservationScreen(),
};