import 'package:employee/data/bindings/initial_bindings.dart';

import 'package:employee/utils/helpers.dart';
import 'package:employee/utils/meta_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: InitialBindings(),
        title: 'Jobbox',
        theme: ThemeData(
          primaryColor: MetaColors.primaryColor,
          colorScheme: const ColorScheme.light(
              primary: MetaColors.primaryColor,
              secondary: MetaColors.textColor,
              tertiary: MetaColors.secondaryTextColor),
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showSplash = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      showSplash = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSplash
        ? const Scaffold(
            body: Center(
              child: LogoWidget(),
            ),
          )
        : const Auth();
  }
}
