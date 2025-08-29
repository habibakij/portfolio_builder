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
                  const SizedBox(height: 16),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Login to continue",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 40),

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
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                              return "Invalid email";
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

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
                        //const SizedBox(height: 30),

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
                        const SizedBox(height: 24),

                        /// Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.white,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Login",
                              style: titleTextStyle(color: AppColors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

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
                        const SizedBox(height: 20),

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
                        const SizedBox(height: 16),

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
