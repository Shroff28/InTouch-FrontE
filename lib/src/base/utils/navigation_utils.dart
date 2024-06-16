import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/ui/auth/account_setup/account_setup_screen.dart';
import 'package:flutter_boilerplate/src/ui/auth/forgot_password/forgot_password_screen.dart';
import 'package:flutter_boilerplate/src/ui/auth/forgot_password/update_password.dart';
import 'package:flutter_boilerplate/src/ui/auth/login/login_screen.dart';
import 'package:flutter_boilerplate/src/ui/auth/signup/signup_screen.dart';
import 'package:flutter_boilerplate/src/ui/auth/spalsh/splash_screen.dart';
import 'package:flutter_boilerplate/src/ui/home/home_screen.dart';

import 'constants/navigation_route_constants.dart';

class NavigationUtils {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get getCurrentContext {
    return _navigatorKey.currentContext!;
  }

  GlobalKey<NavigatorState> get navigatorKey {
    return _navigatorKey;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const SplashScreen(), // To pass args use as const SplashScreen(id: args?["id"])
        );
      case routeLogin:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const LoginScreen(), // To pass args use as const LoginScreen(id: args?["id"])
        );
      case routeSignUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const SignUpScreen(), // To pass args use as const SignUpScreen(id: args?["id"])
        );
      case routeAccountSetup:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const AccountSetupScreen(), // To pass args use as const SignUpScreen(id: args?["id"])
        );
      case routeForgotPassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const ForgotPasswordScreen(), // To pass args use as const ForgotPasswordScreen(id: args?["id"])
        );
      case routeUpdatePassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const UpdatePasswordScreen(), // To pass args use as const SignUpScreen(id: args?["id"])
        );
      case routeTabbar:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const HomeScreen(), // To pass args use as const HomeScreen(id: args?["id"])
        );
      default:
        return _errorRoute(" Comming soon...");
    }
  }

  Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: Center(child: Text(message)));
    });
  }

  void pushReplacement(String routeName, {Object? arguments}) {
    _navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? push(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  void pop({dynamic args}) {
    _navigatorKey.currentState?.pop(args);
  }

  Future<dynamic>? pushAndRemoveUntil(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
}
