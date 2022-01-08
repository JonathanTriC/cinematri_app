import 'package:cinematri_app/ui/pages/bonus_page.dart';
import 'package:cinematri_app/ui/pages/checkout_page.dart';
import 'package:cinematri_app/ui/pages/choose_seat_page.dart';
import 'package:cinematri_app/ui/pages/detail_page.dart';
import 'package:cinematri_app/ui/pages/get_started_page.dart';
import 'package:cinematri_app/ui/pages/main_page.dart';
import 'package:cinematri_app/ui/pages/sign_up_page.dart';
import 'package:cinematri_app/ui/pages/splash_page.dart';
import 'package:cinematri_app/ui/pages/success_checkout_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/get-started': (context) => const GetStarted(),
        '/sign-up': (context) => const SignUpPage(),
        '/bonus': (context) => const BonusPage(),
        '/main': (context) => const MainPage(),
        '/detail': (context) => const DetailPage(),
        '/choose-seat': (context) => const ChooseSeatPage(),
        '/checkout': (context) => const CheckoutPage(),
        '/success': (context) => const SuccessCheckoutPage(),
      },
    );
  }
}
