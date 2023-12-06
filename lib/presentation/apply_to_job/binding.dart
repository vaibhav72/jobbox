import 'package:get/get.dart';

import 'controller.dart';

class ApplyToJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApplyToJobController>(ApplyToJobController());
  }
}
