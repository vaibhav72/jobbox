import 'package:employee/data/controllers/auth_controller.dart';
import 'package:employee/data/controllers/job_controller.dart';
import 'package:employee/data/repository/auth_repository.dart';
import 'package:employee/presentation/home/binding.dart';
import 'package:employee/utils/helpers.dart';
import 'package:employee/utils/meta_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: 'Jobbox',
        theme: ThemeData(
          primaryColor: MetaColors.primaryColor,
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
    HomeBinding().dependencies();
    Get.put(AuthController());
    Get.put(JobController());

    Future.delayed(Duration(seconds: 2), () {
      showSplash = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSplash
        ? Scaffold(
            body: Center(
              child: LogoWidget(),
            ),
          )
        : Auth();
  }
}
