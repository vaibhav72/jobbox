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
  TextEditingController confirmPasswordSignUpController =
      TextEditingController();
  PageController pageController = PageController();
  Rxn<XFile?> profilePic = Rxn<XFile?>();
  final ImagePicker _picker = ImagePicker();
  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();

  ///Image Picker to pick the profile image
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

  /// login callback
  void login() async {
    if (!loginKey.currentState!.validate()) {
      return;
    }

    try {
      authController
          .login(emailSignInController.text, passwordSignInController.text)
          .then((value) {
        emailSignInController.clear();
        passwordSignInController.clear();
      }).catchError((err) {
        showSnackBar(err.toString());
      });
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  /// signup callback
  void register() async {
    if (registerKey.currentState!.validate()) {
      if (profilePic.value == null) {
        showSnackBar("Please select a profile picture");
        return;
      }
      try {
        authController
            .register(
                UserModel(
                    email: emailSignUpController.text,
                    name: nameSignUpController.text,
                    profilePic: profilePic.value!.path,
                    phoneNumber: phoneSignUpController.text),
                passwordSignUpController.text)
            .then((value) {
          emailSignUpController.clear();
          nameSignUpController.clear();
          phoneSignUpController.clear();
          passwordSignUpController.clear();
          confirmPasswordSignUpController.clear();
          profilePic.value = null;
        }).catchError((e) {
          showSnackBar(e.toString());
        });
      } catch (e) {
        showSnackBar(e.toString());
      }
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
    confirmPasswordSignUpController.dispose();
    super.onClose();
  }

  gotoLogin() {
    emailSignUpController.text = "";
    passwordSignUpController.text = "";
    nameSignUpController.text = "";
    phoneSignUpController.text = "";
    confirmPasswordSignUpController.text = "";
    profilePic.value = null;

    pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  gotoRegister() {
    emailSignInController.text = "";
    passwordSignInController.text = "";

    pageController.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
