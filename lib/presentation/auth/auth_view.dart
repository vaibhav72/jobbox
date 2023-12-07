import 'package:employee/presentation/auth/login_view.dart';
import 'package:employee/presentation/auth/sigup_view.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'controller.dart';

class AuthView extends GetView<AuthFlowController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [Loginview(), Signupview()],
    );
  }
}
