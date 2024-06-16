import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/apis/apimanagers/auth_api_manager.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/preference_key_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/base/utils/preference_utils.dart';
import 'package:flutter_boilerplate/src/models/auth/login_model.dart';
import 'package:flutter_boilerplate/src/models/auth/profile_model.dart';
import 'package:flutter_boilerplate/src/models/auth/register_model.dart';
import 'package:flutter_boilerplate/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthController {
  void loginApiCall(
      {required BuildContext context, required ReqLoginModel model}) async {
    await locator<AuthApiManager>().login(model).then((value) async {
      Provider.of<AuthProvider>(context, listen: false)
          .addUserDetails(value.data ?? LoginModel());
      await setString(prefkeyToken, value.data?.accessToken ?? "");
      await setString(prefkeyRefreshToken, value.data?.refreshToken ?? "");
      locator<NavigationUtils>().pushAndRemoveUntil(routeTabbar);
    });
  }

  void registerApiCall(
      {required BuildContext context, required ReqRegisterModel model}) async {
    await locator<AuthApiManager>().register(model).then((value) async {
      Provider.of<AuthProvider>(context, listen: false)
          .addUserDetails(value.data ?? LoginModel());
    });
  }

  void forgotPasswordApiCall(
      {required BuildContext context, required String email}) async {
    await locator<AuthApiManager>().forgotPassword(email).then((value) async {
      locator<NavigationUtils>().pushReplacement(routeUpdatePassword);
    });
  }

  void resetPasswordApiCall(
      {required BuildContext context,
      required ReqResetPasswordModel model}) async {
    await locator<AuthApiManager>().resetPassword(model).then((value) async {
      locator<NavigationUtils>().pushAndRemoveUntil(routeLogin);
    });
  }

  void profileUpdateApiCall(
      {required BuildContext context, required ReqProfileModel model}) async {
    await locator<AuthApiManager>().profileUpdateApi(model).then((value) async {
      locator<NavigationUtils>().pushAndRemoveUntil(routeTabbar);
    });
  }
}
