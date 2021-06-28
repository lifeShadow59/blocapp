import 'package:blocapp/route/route_name.dart';
import 'package:blocapp/view/demo_page_one/demo_page_one.dart';
import 'package:blocapp/view/demo_page_two/demo_page_two.dart';
import 'package:blocapp/view/home/home.dart';
import 'package:blocapp/view/profile/profile.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    // final Map<String, dynamic> arguments = settings.arguments;
    // final arguments = settings.name.getRoutingData;
    Widget screen;
    switch (settings.name) {
      case HomeRoute:
        screen = Home();
        break;

      case ProfileRoute:
        screen = Profile();
        break;

      case DemoPageOneRoute:
        screen = DemoOne();
        break;

      case DemoPageTwoRoute:
        screen = DemoTwo();
        break;

      default:
        screen = Profile();
    }
    return MaterialPageRoute(
      builder: (BuildContext context) => screen,
      settings: settings,
    );
  }
}
