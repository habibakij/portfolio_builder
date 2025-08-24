import 'package:get/get.dart';

import '../controllers/porfolio_controller.dart';

class PorfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PorfolioController>(
      () => PorfolioController(),
    );
  }
}
