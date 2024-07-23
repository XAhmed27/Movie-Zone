import 'package:cinema_booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Sign Up',
        style: TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}