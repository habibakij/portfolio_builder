import 'package:get/get.dart';
import 'package:portfolio_builder/app/modules/onboard/controllers/onboard_controller.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardController>(() => OnboardController());
  }
}
