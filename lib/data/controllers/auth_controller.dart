import 'package:employee/data/controllers/shared_pref_controller.dart';
import 'package:employee/data/models/user_model.dart';
import 'package:employee/presentation/home/binding.dart';
import 'package:employee/utils/helpers.dart';
import 'package:get/get.dart';

import '../repository/auth_repository.dart';

///This is the global authentication controller that maintaions the entire apps
///authentication state
///It is used to login, logout, register and check if the user is logged in
///It is also used to get the current user details
///
class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  Rxn<UserModel> userModel = Rxn();
  Rxn<bool> loading = Rxn(false);
  Rxn<bool> authLoading = Rxn(false);
  late AuthRepository _authRepository;
  @override
  void onInit() {
    super.onInit();
    _authRepository = AuthRepository(
      preferences: SharedPrefsController.to.preferences!,
    );
    init();
  }

  void login(String email, String password) async {
    try {
      authLoading.value = true;
      userModel.value = await _authRepository.login(
        email,
        password,
      );
      HomeBinding().dependencies();
      authLoading.value = false;
    } catch (e) {
      authLoading.value = false;
      showSnackBar(e.toString());
    }
  }

  void logout() {
    try {
      loading.value = true;
      _authRepository.logout();
      userModel.value = null;
      loading.value = false;
    } catch (e) {
      loading.value = false;
      showSnackBar(e.toString());
    }
  }

  void register(UserModel data, String password) async {
    try {
      authLoading.value = true;
      userModel.value = await _authRepository.register(data, password);
      authLoading.value = false;
    } catch (e) {
      authLoading.value = false;
      showSnackBar(e.toString());
    }
  }

  init() async {
    loading.value = true;
    if (await _authRepository.isLoggedIn()) {
      userModel.value = _authRepository.getUserDetails();
      HomeBinding().dependencies();
      loading.value = false;
    }
    loading.value = false;
  }
}
