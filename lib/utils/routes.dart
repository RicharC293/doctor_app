import 'package:doctor_app_template/screens/flow_selector.dart';
import 'package:doctor_app_template/screens/home_screen.dart';
import 'package:doctor_app_template/screens/introduction_screen.dart';
import 'package:doctor_app_template/screens/introduction_screen_morphr.dart';
import 'package:doctor_app_template/screens/reservation_screen.dart';

final routes = {
  FlowSelector.routeName: (context) => const FlowSelector(),
  IntroductionScreen.routeName: (context) => const IntroductionScreen(),
  IntroductionScreenMorphr.routeName: (context) =>
      const IntroductionScreenMorphr(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ReservationScreen.routeName: (context) => const ReservationScreen(),
};
