import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/scaffold_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/string_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/navigation_route_constants.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/controllers/auth/auth_controller.dart';
import 'package:flutter_boilerplate/src/models/auth/register_model.dart';
import 'package:flutter_boilerplate/src/ui/auth/signup/signup_screen.dart';
import 'package:flutter_boilerplate/src/widgets/primary_button.dart';
import 'package:flutter_boilerplate/src/widgets/primary_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _otpFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ThemeText(
                  text: Localization.of().updatePassword,
                  lightTextColor: primaryTextColor,
                  fontSize: fontSize36,
                  fontWeight: fontWeightBold,
                ),
              ),
              const SizedBox(height: 8.0),
              _getOTPTextField(),
              const SizedBox(height: 8.0),
              _getPasswordTextField(),
              const SizedBox(height: 8.0),
              _getConfirmPasswordTextField(),
              const SizedBox(height: 8.0),
              _getLoginButton(),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Have an account?",
                        style: TextStyle(
                          fontSize: fontSize14,
                          color: primaryTextColor,
                        ),
                      ),
                      TextSpan(
                        recognizer: MyTapGestureRecognizer()
                          ..onTap = () {
                            locator<NavigationUtils>()
                                .pushReplacement(routeLogin);
                          },
                        text: " Login",
                        style: const TextStyle(
                          fontSize: fontSize14,
                          color: primaryTextColor,
                          fontWeight: fontWeightSemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                    color: blackColor,
                    thickness: 20,
                    indent: 50,
                    endIndent: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ThemeText(
                      text: "or",
                      lightTextColor: blackColor,
                      fontSize: fontSize12,
                    ),
                  ),
                  Divider(
                    color: blackColor,
                    thickness: 20,
                    indent: 50,
                    endIndent: 50,
                  )
                ],
              ),
              const SizedBox(height: 28.0),
              Image.asset(
                icGoogle,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ).authContainerScaffold(context: context, isLeadingEnabled: true);
  }

  Widget _getOTPTextField() {
    return PrimaryTextField(
      hint: Localization.of().verificationCode,
      focusNode: _otpFocus,
      type: TextInputType.phone,
      textInputAction: TextInputAction.next,
      controller: _otpController,
      onFieldSubmitted: (value) {
        _otpFocus.unfocus();
        _passwordFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isFieldEmpty(Localization.of().msgVerificationCodeEmpty);
      },
    );
  }

  Widget _getPasswordTextField() {
    return PrimaryTextField(
      isObscureText: true,
      hint: Localization.of().newPassword,
      focusNode: _passwordFocus,
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      controller: _passwordController,
      onFieldSubmitted: (value) {
        _passwordFocus.unfocus();
        _confirmPasswordFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isValidPassword();
      },
    );
  }

  Widget _getConfirmPasswordTextField() {
    return PrimaryTextField(
      isObscureText: true,
      hint: Localization.of().confirmPassword,
      focusNode: _confirmPasswordFocus,
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      controller: _confirmPasswordController,
      onFieldSubmitted: (value) {
        _confirmPasswordFocus.unfocus();
      },
      validateFunction: (value) {
        return value!.isValidConfirmPassword(_passwordController.text);
      },
    );
  }

  Widget _getLoginButton() {
    return PrimaryButton(
      buttonColor: blackColor,
      onButtonClick: () {
        if (_formKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          locator<AuthController>().resetPasswordApiCall(
              context: context,
              model: ReqResetPasswordModel(
                  otp: _otpController.text.trim(),
                  password: _passwordController.text.trim()));
        }
      },
      textColor: whiteColor,
      textFontWeight: fontWeightBold,
      buttonText: Localization.of().updatePassword,
    );
  }
}
