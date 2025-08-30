import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_builder/app/core/style/app_color.dart';
import 'package:portfolio_builder/app/core/style/app_style.dart';
import 'package:portfolio_builder/app/core/utils/app_widget.dart';
import 'package:portfolio_builder/app/modules/registration/controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Create Account",
                        style: titleTextStyle(
                          fontSize: 32.0,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      AppWidget().spaceH(24.0),

                      // Name Field
                      CommonTextField(
                        controller: controller.nameController,
                        focusNode: controller.nameFocus,
                        hintText: "Full name",
                        labelText: "Name",
                        keyboardType: TextInputType.name,
                        prefixIcon: const Icon(Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Name is required";
                          return null;
                        },
                      ),
                      AppWidget().spaceH(16.0),

                      // Email Field
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
                      AppWidget().spaceH(16.0),

                      /// Phone
                      CommonTextField(
                        controller: controller.phoneController,
                        focusNode: controller.phoneFocus,
                        labelText: "Phone Number",
                        hintText: "Enter your phone number",
                        prefixIcon: Icon(Icons.phone),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your phone number";
                          }
                          if (value.length < 10) {
                            return "Enter a valid phone number";
                          }
                          return null;
                        },
                      ),
                      AppWidget().spaceH(16.0),

                      // Password Field
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
                      AppWidget().spaceH(24.0),

                      // Sign Up Button
                      CommonButton(
                        width: double.infinity,
                        buttonTitle: "Sign Up",
                        titleStyle: titleTextStyle(color: AppColors.white),
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            // Handle signup action
                          }
                        },
                      ),
                      AppWidget().spaceH(16.0),

                      // Already have account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: normalTextStyle(),
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              " Login",
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
            ),
          ),
        ),
      ),
    );
  }
}
