import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension NavigatorExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}

