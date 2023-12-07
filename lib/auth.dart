import 'package:employee/data/controllers/auth_controller.dart';
import 'package:employee/presentation/auth/auth_view.dart';
import 'package:employee/presentation/home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Auth extends GetView<AuthController> {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.loading.value!
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.userModel.value != null
                ? HomeView()
                : AuthView()));
  }
}
