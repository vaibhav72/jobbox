import 'package:employee/data/controllers/auth_controller.dart';
import 'package:employee/presentation/auth/controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This is the SharedPrefsController
/// It is used to initialize the shared preferences
/// It is also used to initialize the AuthController and AuthFlowController
class SharedPrefsController extends GetxController {
  static SharedPrefsController get to => Get.find<SharedPrefsController>();
  SharedPreferences? preferences;
  @override
  void onInit() async {
    super.onInit();
    preferences = await SharedPreferences.getInstance();
    Get.put(AuthController());
    Get.put(AuthFlowController());
  }
}
