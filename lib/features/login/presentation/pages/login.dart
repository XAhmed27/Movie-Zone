import 'package:cinema_booking_app/config/di/di.dart';
import 'package:cinema_booking_app/config/routes/app_routes.dart';
import 'package:cinema_booking_app/core/services/api/api_service.dart';
import 'package:cinema_booking_app/core/utils/app_colors.dart';
import 'package:cinema_booking_app/core/widgets/custom_button.dart';
import 'package:cinema_booking_app/core/widgets/custom_text_form_feilds.dart';
import 'package:cinema_booking_app/features/login/data/models/login_request_body.dart';
import 'package:cinema_booking_app/features/login/presentation/manager/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushNamed(context, AppRoutes.splash);
            } else if (state is LoginError) {
              // Show an error message
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h),
                        _buildTitle(),
                        SizedBox(height: 2.h),
                        _buildSubtitle(),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email / Phone Number',
                          prefixIcon: Icons.email,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          hintText: 'Password',
                          prefixIcon: Icons.lock,
                          obscureText: !_isPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 2.h),
                        ElevatedButton(
                          onPressed: () {
                            final email = _emailController.text;
                            final password = _passwordController.text;

                            if (email.isNotEmpty && password.isNotEmpty) {
                              final requestBody = LoginRequestBody(
                                  email: email, password: password);
                              context.read<LoginCubit>().login(requestBody);
                            } else {
                              // Show an error message
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 6.h),
                            backgroundColor: AppColors.secondaryColor,
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        _buildSignUpOption(),
                      ],
                    ),
                  ),
                ),
                if (state is LoginLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Moviezone',
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Column(
      children: [
        Text(
          'Welcome Back!',
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          'Please sign in to your account to continue',
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not registered yet?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
        CustomButton(
          onPressed: () {
            // Navigate to the sign-up page
          },
        ),
      ],
    );
  }
}
