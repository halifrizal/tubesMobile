import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String pass) async {
    try {
      UserCredential dataUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      if (dataUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
        Get.snackbar("Selamat Datang " + email + " ", "Berhasil Login");
      } else {
        Get.snackbar(
          "Notifikasi",
          "Verifikasi Email Terlebih Dahulu Di $email",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "User Tidak Terdaftar");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Password Salah");
      } else {
        Get.snackbar("Error", "Terjadi Kesalahan");
      }
    }
  }

  void daftar(String email, String pass) async {
    try {
      UserCredential dataUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      await dataUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Verifikasi Diri Kamu",
          middleText: "Cek Email Verifikasi di $email",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Saya Mengerti");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "Password Terlalu Lemah");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "Akun Sudah Terdaftar");
      } else {
        Get.snackbar("Error", "Terjadi Kesalahan");
      }
    }
  }

  void Logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.HOME);
    Get.snackbar("Notifikasi", "Berhasil Logout");
  }

  void lupa(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Get.defaultDialog(
      title: "Berhasil Reset",
      middleText: "Kami Telah Mengirimkan Link Reset di $email",
      onConfirm: () {
        Get.back();
        Get.back();
      },
      textConfirm: "Saya Mengerti",
    );
  }

  // void subs() async {
  //   await FirebaseMessaging.instance.subscribeToTopic('osas');
  //   Get.snackbar("Notifikasi", "Berhasil Subscribe Konten");
  // }
}
