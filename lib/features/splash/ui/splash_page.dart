import 'package:cinema_booking_app/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/theme/app_assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 50.w,
          child: Image.asset(
            "assets/images/splash.png",
          ),
        ),
      ),
    );
  }
}
