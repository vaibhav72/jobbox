import 'package:employee/data/controllers/job_controller.dart';
import 'package:employee/presentation/home/controller.dart';

import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(JobController());
  }
}
