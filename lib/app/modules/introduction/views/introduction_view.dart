import '../../../../data-assets/warna.dart';
import '../../../../routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  IntroductionView() {
    controller.getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "App Al-Quran",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Dan bila dibacakan Al-Quran, maka dengarkan secara baik-baik, dan perhatikan secara seksama supaya kamu mendapat rahmat. (QS. Al-A’raf: 204)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 300,
              child: Lottie.asset("assets/lottie/animasi.json"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              child: Text(
                "Mulai",
                style: TextStyle(
                  color: Get.isDarkMode ? putih : ijoTerang,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Get.isDarkMode ? ijoGelap : putih,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
