import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Nilai: ${controller.count.value}',
              style: TextStyle(fontSize: 24),
            )),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.increment,
              child: Text('Tambahkan'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.removeDataFromStorage,
              child: Text('Hapus Data'),
            ),
          ],
        ),
      ),
    );
  }
}