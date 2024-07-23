import 'package:cinema_booking_app/config/di/di.dart';
import 'package:cinema_booking_app/core/services/api/api_service.dart';
import 'package:cinema_booking_app/features/login/presentation/manager/login_cubit.dart';
import 'package:cinema_booking_app/features/login/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/splash/ui/splash_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const SplashPage(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) =>
              const LoginPage(),
        );
    }
    return null;
  }
}
