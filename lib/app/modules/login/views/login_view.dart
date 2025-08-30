import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio_builder/app/core/style/app_color.dart';
import 'package:portfolio_builder/app/core/style/app_style.dart';
import 'package:portfolio_builder/app/core/utils/app_widget.dart';
import 'package:portfolio_builder/app/modules/login/controllers/login_controller.dart';
import 'package:portfolio_builder/app/routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// App Logo / Title
                  const Icon(Icons.person_pin, size: 90, color: Colors.white),
                  AppWidget().spaceH(16.0),
                  Text(
                    "Welcome Back!",
                    style: titleTextStyle(
                      fontSize: 32.0,
                      color: AppColors.white,
                    ),
                  ),
                  AppWidget().spaceH(8.0),
                  const Text(
                    "Login to continue",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  AppWidget().spaceH(40.0),

                  /// Login Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          /// Email
                          CommonTextField(
                            controller: controller.emailController,
                            focusNode: controller.emailFocus,
                            hintText: "Enter your email",
                            labelText: "Email",
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Email required";
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value))
                                return "Invalid email";
                              return null;
                            },
                          ),
                          AppWidget().spaceH(16.0),

                          /// Password
                          CommonTextField(
                            controller: controller.passwordController,
                            focusNode: controller.passwordFocus,
                            hintText: "Enter your password",
                            labelText: "Password",
                            obscureText: true,
                            prefixIcon: const Icon(Icons.lock_outline),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Password required";
                              if (value.length < 6) return "Min 6 characters";
                              return null;
                            },
                          ),

                          /// Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                          AppWidget().spaceH(24.0),

                          /// Login Button
                          CommonButton(
                            width: double.infinity,
                            buttonTitle: "Login",
                            titleStyle: titleTextStyle(color: AppColors.white),
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                Get.offNamed(Routes.HOME);
                              }
                            },
                          ),
                          AppWidget().spaceH(20.0),

                          /// OR Divider
                          Row(
                            children: const [
                              Expanded(child: Divider(thickness: 1)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("OR"),
                              ),
                              Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                          AppWidget().spaceH(20.0),

                          /// Social Login Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 20),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.g_mobiledata,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                          AppWidget().spaceH(16.0),

                          /// Signup Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.REGISTRATION);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: normalTextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
