import '../../../../data-assets/warna.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth_controller.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  bool hide = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  TextField(
                    obscureText: hide,
                    controller: password,
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: ijoTerang,
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock, color: ijoDark),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: ijoTerang,
                        padding: const EdgeInsets.symmetric(horizontal: 100)),
                    onPressed: () => authC.login(username.text, password.text),
                    child: const Text("Login"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: ijoTerang,
                        padding: const EdgeInsets.symmetric(horizontal: 100)),
                    onPressed: () => Get.offAllNamed(Routes.HOME),
                    child: const Text("Back"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Get.toNamed(Routes.RESET),
                      child: const Text(
                        "Forget?",
                        style: TextStyle(color: ijoTerang),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Get.toNamed(Routes.SIGNUP),
                      child: const Text(
                        "Daftar",
                        style: TextStyle(color: ijoTerang),
                      ),
                    ),
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
                      "Menu Login",
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
