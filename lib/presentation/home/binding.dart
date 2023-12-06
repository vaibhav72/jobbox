import 'package:employee/presentation/home/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
