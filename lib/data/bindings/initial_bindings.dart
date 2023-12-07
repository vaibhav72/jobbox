import 'package:employee/data/controllers/shared_pref_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SharedPrefsController());
  }
}
