import 'package:flutter/material.dart';
import 'package:water_jug_riddle/pages/input_page.dart';
import 'package:water_jug_riddle/pages/welcome_page.dart';

import 'custom_routes/transparent_route.dart';

class NavigatorManager {
  static const String welcomePage = '/welcome_page';
  static const String inputPage = '/input_page';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if(settings.name == inputPage){
      return TransparentRoute(
          builder: (_) => const InputPage(), settings: settings);
    }
    /// default case
    return TransparentRoute(
        builder: (_) => const WelcomePage(), settings: settings);
  }

  static String get homePage => welcomePage;
}
