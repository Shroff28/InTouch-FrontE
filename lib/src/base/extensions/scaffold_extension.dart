import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';

extension ScaffoldExtension on Widget {
  Scaffold authContainerScaffold({required BuildContext context}) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          color: primaryColor,
          height: context.getHeight(),
          child: Column(
            children: [
              SizedBox(height: context.getHeight(0.07)),
              Image.asset(headerLogo, height: 40),
              SizedBox(height: context.getHeight(0.08)),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: this,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Dialog dialogContainer({double height = 350}) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 20.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(20.0),
        child: this,
      ),
    );
  }
}
