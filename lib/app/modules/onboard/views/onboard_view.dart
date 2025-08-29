import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio_builder/app/core/style/app_color.dart';
import 'package:portfolio_builder/app/core/style/app_style.dart';
import 'package:portfolio_builder/app/modules/onboard/controllers/onboard_controller.dart';
import 'package:portfolio_builder/app/routes/app_pages.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            /// Background PageView (full screen images)
            Expanded(
              child: PageView.builder(
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
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Container(
                      color: AppColors.black.withValues(alpha: .4),
                    ),
                  );
                },
              ),
            ),

            /// Foreground content
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor,
                    AppColors.secondaryColor,
                  ], // purple gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    controller.pages[controller.currentPage.value]["title"]!,
                    textAlign: TextAlign.center,
                    style: titleTextStyle(
                      fontSize: 28.0,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    controller.pages[controller.currentPage.value]["subtitle"]!,
                    textAlign: TextAlign.center,
                    style: normalTextStyle(
                      fontSize: 16.0,
                      color: AppColors.whiteLiteColor,
                    ),
                  ),
                  const SizedBox(height: 12.0),

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
                                  ? AppColors.white
                                  : AppColors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),

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
                                  color: AppColors.whiteLiteColor,
                                  fontSize: 16,
                                ),
                              ),
                            )
                            : const SizedBox.shrink(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.black,
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
                              Get.toNamed(Routes.LOGIN);
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
