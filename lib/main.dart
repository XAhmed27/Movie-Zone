import 'package:cinema_booking_app/cinema_app.dart';
import 'package:cinema_booking_app/config/di/di.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const CinemaApp());
}


