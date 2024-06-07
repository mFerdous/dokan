import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/landing_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/sign_in/presentation/pages/sign_in_page.dart';
import '../../features/sign_up/presentation/pages/sign_up_page.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return _getInitialRoute();
      case '/sign_up_page':
        return _signUpPageRoute();
      case '/sign_in_page':
        return _signInPageRoute();
      case '/profile_page':
        return _profilePageRoute();
      default:
        return null;
    }
  }

  static MaterialPageRoute _routeBuilder(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  static MaterialPageRoute _getInitialRoute() {
    return _routeBuilder(
      const LandingPage(),
    );
  }

  static MaterialPageRoute _signUpPageRoute() {
    return _routeBuilder(
      const SignUpPage(),
    );
  }

  static MaterialPageRoute _signInPageRoute() {
    return _routeBuilder(
      const SignInPage(),
    );
  }

  static MaterialPageRoute _profilePageRoute() {
    return _routeBuilder(
      const ProfilePage(),
    );
  }
}
