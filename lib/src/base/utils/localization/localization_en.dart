import 'localization.dart';

class LocalizationEN implements Localization {
  @override
  String get appName => "Flutter Boilerplate";

  @override
  String get ok => "OK";

  @override
  String get cancel => "Cancel";

  @override
  String get alertPermissionNotRestricted =>
      "Please grant permission from settings to access this feature";

  @override
  String get internetNotConnected =>
      "No internet connection. Please check your internet connection";

  @override
  String get poorInternetConnection =>
      "Poor internet connection. Please check your internet connection";

  @override
  String get delete => "Delete";

  @override
  String get edit => "Edit";

  @override
  String get done => "Done";

  @override
  String get cameraTitle => "Camera";

  @override
  String get galleryTitle => "Gallery";

  @override
  String get no => "No";

  @override
  String get yes => "Yes";

  @override
  String get logout => "Logout";

  @override
  String get save => "Save";

  @override
  String get search => "Search";

  // Auth Strings
  @override
  String get verify => "Verify";

  @override
  String get login => "Login";

  @override
  String get signUp => "SignUp";

  @override
  String get sendOTP => "Send OTP";

  @override
  String get email => "Email";

  @override
  String get userName => "Username";

  @override
  String get verificationCode => "Verification Code";

  @override
  String get password => "Password";

  @override
  String get confirmPassword => "Confirm Password";

  @override
  String get newPassword => "New Password";

  @override
  String get updatePassword => "Update Password";

  @override
  String get forgotPassword => "Forgot Password";

  @override
  String get msgEmailEmpty => "Email is empty";

  @override
  String get msgEmailInvalid => "Email is not valid";

  @override
  String get msgUserNameEmpty => "Username is empty";

  @override
  String get msgVerificationCodeEmpty => "Verification Code is empty";

  @override
  String get msgUserNameInvalid => "Username is not valid";

  @override
  String get msgPasswordEmpty => "Password is empty";

  @override
  String get msgPasswordNotMatch => "Password doesn't match";

  @override
  String get msgPasswordError =>
      "Password should be atleast 8 characters long and have atleast one uppercase, one alphanumeric and one number.";

//SignUp Flow
  @override
  String get basicDetails => "Basic Details";

  @override
  String get accountDetails => "Account Details";

  @override
  String get contactDetails => "Contact Details";

  @override
  String get firstName => "First Name";

  @override
  String get lastName => "Last Name";

  @override
  String get dateOfBirth => "Date of Birth";

  @override
  String get next => "Next";

  @override
  String get back => "Back";

  @override
  String get signUpWithGoogle => "Sign Up with Google";
}
