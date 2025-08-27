import 'dart:async';

import 'package:get/get.dart';
import 'package:portfolio_builder/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.ONBOARD);
    });
  }
}
