import 'package:employee/data/controllers/auth_controller.dart';
import 'package:employee/presentation/auth/auth_view.dart';
import 'package:employee/presentation/home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// This is the Auth widget
/// This detemrines if the user is logged in or not
/// If the user is logged in, it shows the HomeView
/// If the user is not logged in, it shows the AuthView
class Auth extends GetView<AuthController> {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.loading.value!
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.userModel.value != null
                ? const HomeView()
                : const AuthView()));
  }
}
