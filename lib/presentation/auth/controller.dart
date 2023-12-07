import 'package:employee/data/controllers/auth_controller.dart';
import 'package:employee/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/helpers.dart';

class AuthFlowController extends GetxController {
  static AuthFlowController get to => Get.find<AuthFlowController>();
  AuthController get authController => AuthController.to;
  Rxn<bool> get loading => authController.authLoading;
  TextEditingController emailSignInController = TextEditingController();
  TextEditingController passwordSignInController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController nameSignUpController = TextEditingController();
  TextEditingController phoneSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  PageController pageController = PageController();
  Rxn<XFile?> profilePic = Rxn<XFile?>();
  ImagePicker _picker = ImagePicker();
  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profilePic.value = XFile(pickedFile.path);
      } else {
        showSnackBar("No file selected");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void login() async {
    if (!loginKey.currentState!.validate()) {
      return;
    }

    authController.login(
        emailSignInController.text, passwordSignInController.text);
  }

  void register() async {
    if (registerKey.currentState!.validate()) {
      authController.register(
          UserModel(
              email: emailSignUpController.text,
              name: nameSignUpController.text,
              profilePic: profilePic.value!.path,
              phoneNumber: phoneSignUpController.text),
          passwordSignUpController.text);
    }
  }

  @override
  void onClose() {
    emailSignInController.dispose();
    passwordSignInController.dispose();
    emailSignUpController.dispose();
    passwordSignUpController.dispose();
    nameSignUpController.dispose();
    phoneSignUpController.dispose();
    super.onClose();
  }
}
