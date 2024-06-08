import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/models/auth/login_model.dart';

class AuthProvider with ChangeNotifier {
  LoginModel _loginData = LoginModel();

  LoginModel get userDetails => _loginData;

  addUserDetails(LoginModel data) {
    _loginData = data;
    notifyListeners();
  }
}
