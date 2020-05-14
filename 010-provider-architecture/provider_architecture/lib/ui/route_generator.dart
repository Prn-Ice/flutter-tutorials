import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/views/home_view.dart';
import 'package:provider_architecture/ui/views/login_view.dart';
import 'package:provider_architecture/ui/views/post_view.dart';

class RouteGenerator {
  static Route<Object> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());

      case '/post':
        return MaterialPageRoute(builder: (_) => PostView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
