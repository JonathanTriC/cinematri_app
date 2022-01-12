import 'package:cinematri_app/cubit/auth_cubit.dart';
import 'package:cinematri_app/cubit/movie_cubit.dart';
import 'package:cinematri_app/cubit/page_cubit.dart';
import 'package:cinematri_app/ui/pages/bonus_page.dart';
import 'package:cinematri_app/ui/pages/checkout_page.dart';
import 'package:cinematri_app/ui/pages/choose_seat_page.dart';
import 'package:cinematri_app/ui/pages/get_started_page.dart';
import 'package:cinematri_app/ui/pages/main_page.dart';
import 'package:cinematri_app/ui/pages/sign_in_page.dart';
import 'package:cinematri_app/ui/pages/sign_up_page.dart';
import 'package:cinematri_app/ui/pages/splash_page.dart';
import 'package:cinematri_app/ui/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => MovieCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStarted(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/choose-seat': (context) => const ChooseSeatPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/success': (context) => const SuccessCheckoutPage(),
        },
      ),
    );
  }
}
