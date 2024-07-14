import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/image_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/widgets/themewidgets/theme_text.dart';

extension ScaffoldExtension on Widget {
  Scaffold authContainerScaffold(
      {required BuildContext context, required bool isLeadingEnabled}) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          color: primaryColor,
          height: context.getHeight(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.getHeight(0.07)),
              isLeadingEnabled
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            locator<NavigationUtils>().pop();
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: whiteColor,
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 30,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Image.asset(headerLogo, height: 40),
                        const SizedBox(width: 10),
                      ],
                    )
                  : Image.asset(headerLogo, height: 40),
              SizedBox(height: context.getHeight(0.08)),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
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

  Scaffold homeContainerScaffold({required BuildContext context}) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: this,
      ),
    );
  }

  Scaffold appBarScaffold({
    required BuildContext context,
    required String title,
    required bool isFilter,
    Widget widget = const SizedBox(),
  }) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: ThemeText(
            text: title,
            lightTextColor: primaryTextColor,
            fontSize: fontSize22,
            fontWeight: fontWeightBold,
          ),
          elevation: 10,
          centerTitle: true,
          actions: [
            isFilter
                ? IconButton(
                    icon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.filter_alt),
                    ),
                    onPressed: () {},
                  )
                : widget,
          ]),
      body: SafeArea(
        top: true,
        child: this,
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
