import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio_builder/app/core/style/app_style.dart';
import 'package:portfolio_builder/app/modules/onboard/controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            /// Background PageView (full screen images)
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.pages.length,
              onPageChanged: (index) {
                controller.currentPage.value = index;
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(controller.pages[index]["image"]!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black.withValues(alpha: .4)),
                );
              },
            ),

            /// Foreground content
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          controller.pages[controller
                              .currentPage
                              .value]["title"]!,
                          textAlign: TextAlign.center,
                          style: titleTextStyle(
                            fontSize: 28.0,

                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          controller.pages[controller
                              .currentPage
                              .value]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: normalTextStyle(
                            fontSize: 16.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),

                  /// Page Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: controller.currentPage.value == index ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              controller.currentPage.value == index
                                  ? Colors.white
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.currentPage.value !=
                                controller.pages.length - 1
                            ? TextButton(
                              onPressed: () {
                                controller.pageController.jumpToPage(
                                  controller.pages.length - 1,
                                );
                              },
                              child: Text(
                                "Skip",
                                style: normalTextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            )
                            : const SizedBox.shrink(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (controller.currentPage.value ==
                                controller.pages.length - 1) {
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              controller.pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                          child: Text(
                            controller.currentPage.value ==
                                    controller.pages.length - 1
                                ? "Get Started"
                                : "Next",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
