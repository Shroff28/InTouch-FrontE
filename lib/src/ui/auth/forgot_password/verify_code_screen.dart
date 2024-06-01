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
import 'package:flutter_boilerplate/src/ui/auth/signup/signup_screen.dart';
import 'package:flutter_boilerplate/src/widgets/primary_button.dart';
import 'package:flutter_boilerplate/src/widgets/primary_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();
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
                child: Column(
                  children: [
                    ThemeText(
                      text: Localization.of().forgotPassword,
                      lightTextColor: primaryTextColor,
                      fontSize: fontSize36,
                      fontWeight: fontWeightBold,
                    ),
                    const ThemeText(
                      text: "Don't Worry, We are there for you",
                      lightTextColor: primaryTextColor,
                      fontSize: fontSize16,
                      fontWeight: fontWeightMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28.0),
              _getEmailTextField(),
              const SizedBox(height: 8.0),
              _getLoginButton(),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "I am new user",
                        style: TextStyle(
                          fontSize: fontSize14,
                          color: primaryTextColor,
                        ),
                      ),
                      TextSpan(
                        recognizer: MyTapGestureRecognizer()
                          ..onTap = () {
                            locator<NavigationUtils>()
                                .pushReplacement(routeSignUp);
                          },
                        text: " Sign Up",
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
    ).authContainerScaffold(context: context);
  }

  Widget _getEmailTextField() {
    return PrimaryTextField(
      hint: Localization.of().verificationCode,
      focusNode: _emailFocus,
      type: TextInputType.phone,
      textInputAction: TextInputAction.done,
      controller: _emailController,
      onFieldSubmitted: (value) {
        _emailFocus.unfocus();
      },
      validateFunction: (value) {
        return value!.isFieldEmpty(Localization.of().msgVerificationCodeEmpty);
      },
    );
  }

  Widget _getLoginButton() {
    return PrimaryButton(
      buttonColor: blackColor,
      onButtonClick: () {
        if (_formKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          locator<NavigationUtils>().pushReplacement(routeUpdatePassword);
        }
      },
      textColor: whiteColor,
      textFontWeight: fontWeightBold,
      buttonText: Localization.of().verify,
    );
  }
}
