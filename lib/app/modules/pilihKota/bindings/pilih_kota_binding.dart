import 'package:get/get.dart';

import '../controllers/pilih_kota_controller.dart';

class PilihKotaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihKotaController>(
      () => PilihKotaController(),
    );
  }
}
