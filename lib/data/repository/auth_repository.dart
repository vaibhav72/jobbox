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
      bool registered = preferences.containsKey(email);
      if (!registered) {
        throw Exception("User not registered");
      }
      String passwordFromStorage =
          preferences.getString("${email}password") ?? '';
      if (passwordFromStorage == password) {
        await preferences.setString("token", email);
        return getUserDetails();
      } else {
        throw Exception("Invalid Credentials");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(UserModel data, String password) async {
    try {
      ///logic for api calls but now temporarily using local auth
      await preferences.setString("token", data.email);
      await preferences.setString(data.email, data.toJson());
      await preferences.setString(("${data.email}password"), password);

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      if (preferences == null)
        preferences = await SharedPreferences.getInstance();
      return preferences.getString('token') != null;
    } catch (e) {
      rethrow;
    }
  }

  UserModel getUserDetails() {
    try {
      String email = preferences.getString('token') ?? '';
      String? data = preferences.getString(email);
      if (data != null) {
        return UserModel.fromJson(data);
      } else {
        preferences.remove('token');
        throw Exception("User not logged in");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    try {
      return preferences.remove('token');
    } catch (e) {
      rethrow;
    }
  }
}
