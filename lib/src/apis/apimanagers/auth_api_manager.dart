import 'package:flutter_boilerplate/src/apis/api_route_constant.dart';
import 'package:flutter_boilerplate/src/apis/api_service.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/models/auth/login_model.dart';
import 'package:flutter_boilerplate/src/models/auth/profile_model.dart';
import 'package:flutter_boilerplate/src/models/auth/register_model.dart';
import 'package:flutter_boilerplate/src/models/res_base_model.dart';

class AuthApiManager {
  Future<ResLoginModel> login(ReqLoginModel request) async {
    final response = await locator<ApiService>().post(
      apiLogin,
      data: request.toJson(),
    );
    return ResLoginModel.fromJson(response?.data);
  }

  Future<ResLoginModel> register(ReqRegisterModel request) async {
    final response = await locator<ApiService>().post(
      apiRegister,
      data: request.toJson(),
    );
    return ResLoginModel.fromJson(response?.data);
  }

  Future<ResBaseModel> forgotPassword(String email) async {
    final response = await locator<ApiService>().post(
      apiForgotPassword,
      data: {"email": email},
    );
    return ResBaseModel.fromJson(response?.data);
  }

  Future<ResBaseModel> resetPassword(ReqResetPasswordModel request) async {
    final response = await locator<ApiService>().post(
      apiRegister,
      data: request.toJson(),
    );
    return ResBaseModel.fromJson(response?.data);
  }

  Future<ResBaseModel> profileUpdateApi(ReqProfileModel request) async {
    final response = await locator<ApiService>().post(
      apiProfileUpdate,
      data: request.toJson(),
    );
    return ResBaseModel.fromJson(response?.data);
  }
}
