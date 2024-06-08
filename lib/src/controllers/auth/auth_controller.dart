import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/apis/apimanagers/auth_api_manager.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/preference_key_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/base/utils/preference_utils.dart';
import 'package:flutter_boilerplate/src/base/utils/progress_dialog_utils.dart';
import 'package:flutter_boilerplate/src/models/auth/login_model.dart';
import 'package:flutter_boilerplate/src/models/auth/register_model.dart';
import 'package:flutter_boilerplate/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthController {
  void loginApiCall(
      {required BuildContext context, required ReqLoginModel model}) async {
    ProgressDialogUtils.showProgressDialog();
    await locator<AuthApiManager>().login(model).then((value) async {
      ProgressDialogUtils.dismissProgressDialog();
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
}
