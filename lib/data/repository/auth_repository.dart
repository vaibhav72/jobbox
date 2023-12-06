import 'package:employee/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  late SharedPreferences preferences;

  AuthRepository() {
    getInstance();
  }

  getInstance() async {
    preferences = await SharedPreferences.getInstance();
  }

  ///Logs the user In and returns a UserModel object
  Future<UserModel> login(String email, String password) async {
    try {
      ///logic for api calls but now temporarily using local auth
      await preferences.setString("token", email);
      return UserModel(email: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      return preferences.getString('token') == null;
    } catch (e) {
      rethrow;
    }
  }

  UserModel getUserDetails() {
    try {
      String? email = preferences.getString('token');
      return UserModel(email: email!);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    try {
      return preferences.clear();
    } catch (e) {
      rethrow;
    }
  }
}
