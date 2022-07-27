import '../../../../data-assets/warna.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkMode = true;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(appDark);
    } else {
      Get.changeTheme(appWhite);
    }
    update();
  }
}
