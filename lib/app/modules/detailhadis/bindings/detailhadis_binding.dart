import 'package:get/get.dart';

import '../controllers/detailhadis_controller.dart';

class DetailhadisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailhadisController>(
      () => DetailhadisController(),
    );
  }
}
