import 'package:flutter_boilerplate/src/apis/api_route_constant.dart';
import 'package:flutter_boilerplate/src/apis/api_service.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/models/auth/login_model.dart';
import 'package:flutter_boilerplate/src/models/auth/register_model.dart';

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
}
