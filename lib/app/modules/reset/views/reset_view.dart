import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../controller/auth_controller.dart';
import '../../../../data-assets/warna.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/reset_controller.dart';

class ResetView extends GetView<ResetController> {
  TextEditingController username = TextEditingController();

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());

    return Scaffold(
      backgroundColor: ijoTerang,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 400),
              width: double.infinity,
              height: 450,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.only(top: 200, left: 50, right: 50),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0.1, blurRadius: 5)
                  ]),
              child: Column(
                children: [
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: ijoTerang,
                        hintText: "UserName",
                        prefixIcon: const Icon(
                          Icons.people,
                          color: ijoDark,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: ijoTerang,
                        padding: const EdgeInsets.symmetric(horizontal: 100)),
                    onPressed: () => authC.lupa(username.text),
                    child: const Text("Reset"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ijoTerang,
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                    ),
                    onPressed: () => Get.offAllNamed(Routes.LOGIN),
                    child: const Text("Back"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Positioned(
                top: 80,
                left: 55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    Text(
                      "Menu Reset Akun",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 17),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
