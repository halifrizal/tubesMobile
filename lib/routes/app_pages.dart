import 'package:get/get.dart';

import '../app/modules/detail/bindings/detail_binding.dart';
import '../app/modules/detail/views/detail_view.dart';
import '../app/modules/favorite/bindings/favorite_binding.dart';
import '../app/modules/favorite/views/favorite_view.dart';
import '../app/modules/home/bindings/home_binding.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/modules/introduction/bindings/introduction_binding.dart';
import '../app/modules/introduction/views/introduction_view.dart';
import '../app/modules/jadwal/bindings/jadwal_binding.dart';
import '../app/modules/jadwal/views/jadwal_view.dart';
import '../app/modules/juzDetail/bindings/juz_detail_binding.dart';
import '../app/modules/juzDetail/views/juz_detail_view.dart';
import '../app/modules/last_read/bindings/last_read_binding.dart';
import '../app/modules/last_read/views/last_read_view.dart';
import '../app/modules/login/bindings/login_binding.dart';
import '../app/modules/login/views/login_view.dart';
import '../app/modules/pilihKota/bindings/pilih_kota_binding.dart';
import '../app/modules/pilihKota/views/pilih_kota_view.dart';
import '../app/modules/reset/bindings/reset_binding.dart';
import '../app/modules/reset/views/reset_view.dart';
import '../app/modules/search/bindings/search_binding.dart';
import '../app/modules/search/views/search_view.dart';
import '../app/modules/signup/bindings/signup_binding.dart';
import '../app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.LAST_READ,
      page: () => LastReadView(),
      binding: LastReadBinding(),
    ),
    GetPage(
      name: _Paths.JUZ_DETAIL,
      page: () => JuzDetailView(),
      binding: JuzDetailBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESET,
      page: () => ResetView(),
      binding: ResetBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_KOTA,
      page: () => PilihKotaView(),
      binding: PilihKotaBinding(),
    ),
  ];
}
