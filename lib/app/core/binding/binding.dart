import 'package:get/get.dart';
import 'package:portfolio_builder/app/modules/splash/controllers/splash_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
