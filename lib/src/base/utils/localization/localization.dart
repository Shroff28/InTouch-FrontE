import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:intl/intl.dart';

import 'localization_en.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
      ].contains(locale.languageCode);

// @override
////   bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => _load(locale);

  static Future<Localization> _load(Locale locale) async {
    final String name =
        (locale.countryCode == null || locale.countryCode!.isEmpty)
            ? locale.languageCode
            : locale as String;

    final localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    // if( locale.languageCode == "fr" ) {
    //   return LocalizationFR();
    // } else {
    //   return LocalizationEN();
    // }

    return LocalizationEN();
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}

abstract class Localization {
  static Localization of() {
    return Localizations.of<Localization>(
        locator<NavigationUtils>().getCurrentContext, Localization)!;
  }

  // Common Strings
  String get internetNotConnected;
  String get poorInternetConnection;
  String get alertPermissionNotRestricted;
  String get appName;
  String get ok;
  String get cancel;
  String get edit;
  String get delete;
  String get done;
  String get logout;
  String get galleryTitle;
  String get cameraTitle;
  String get yes;
  String get no;
  String get save;
  String get search;

  // Auth Stringd
  String get verify;
  String get login;
  String get signUp;
  String get sendOTP;
  String get mobile;
  String get email;
  String get password;
  String get userName;
  String get verificationCode;
  String get confirmPassword;
  String get newPassword;
  String get updatePassword;
  String get forgotPassword;
  String get msgEmailEmpty;
  String get msgEmailInvalid;
  String get msgUserNameEmpty;
  String get msgPhoneEmpty;
  String get msgUserNameInvalid;
  String get msgVerificationCodeEmpty;
  String get msgPasswordEmpty;
  String get msgPasswordError;
  String get msgPasswordNotMatch;

  //SignUp Flow
  String get basicDetails;
  String get accountDetails;
  String get contactDetails;
  String get country;
  String get state;
  String get postalCode;
  String get city;
  String get address;
  String get firstName;
  String get lastName;
  String get dateOfBirth;
  String get next;
  String get back;
  String get signUpWithGoogle;

  //App Strings
  String get home;
  String get video;
  String get audio;
  String get chat;
  String get community;
}
