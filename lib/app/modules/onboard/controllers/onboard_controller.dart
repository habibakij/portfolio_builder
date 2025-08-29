import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio_builder/app/core/asset/app_assets.dart';

class OnboardController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  RxList<Map<String, String>> pages = <Map<String, String>>[].obs;

  @override
  void onInit() {
    _initPages();
    super.onInit();
  }

  _initPages() {
    pages.value = [
      {
        "title": "Create Your Portfolio",
        "subtitle":
            "Easily build a professional portfolio that highlights your skills, projects, and achievements.",
        "image": tutorialImage1,
      },
      {
        "title": "Personalize Your Design",
        "subtitle":
            "Pick from modern templates and customize colors, fonts, and layouts to match your style.",
        "image": tutorialImage2,
      },
      {
        "title": "Share Anywhere",
        "subtitle":
            "Publish your portfolio online and share your unique link with employers, clients, or peers.",
        "image": tutorialImage3,
      },
      {
        "title": "Boost Your Visibility",
        "subtitle":
            "Stand out in your field by showcasing your expertise and attracting new opportunities.",
        "image": tutorialImage4,
      },
      {
        "title": "Build Your Career Path",
        "subtitle":
            "Turn your portfolio into a career hub that grows with you and supports your professional journey.",
        "image": tutorialImage5,
      },
    ];
  }
}
