import 'package:carty_e_coomerce_app/constants/constants_strings.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/singup_page.dart';

class AppRouter {
  Route? onGenerateRouter(RouteSettings settings) {
    switch (settings.name) {
      case ConstantsStrings.singUp:
        return MaterialPageRoute(builder: (context) => const SingUp());

      case ConstantsStrings.login:
        return MaterialPageRoute(builder: (context) => const Login());

      case ConstantsStrings.home:
        return MaterialPageRoute(builder: (context) => const Home());

    }
    return null;
  }
}
