import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/porfolio_controller.dart';

class PorfolioView extends GetView<PorfolioController> {
  const PorfolioView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PorfolioView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PorfolioView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
