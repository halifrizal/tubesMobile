import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:jadwal_sholat_coba/controller/searchAyat.dart';

import '../../../../data-assets/warna.dart';
import '../../../../data/models/surah.dart';
import '../../../../routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/juz.dart' as juz;

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controller/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/themeC.dart';

class HomeView extends GetView<HomeController> {
  HomeView() {
    // controller._getThemeStatus();
    controller.getThemeStatus();
  }

  Widget atas() {
    return AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: const Text(
        'Menu Bookmark',
        style: TextStyle(color: Colors.white),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  Widget adaIsi() {
    return const Center(
      child: Text("INI ADA ISI"),
    );
  }

  Widget tidakAda() {
    return Center(
      child: Column(
        children: [
          Text("INI TIDAK ADA ISI"),
          Text("Login Di sini"),
          TextButton(
            onPressed: () => Get.toNamed(Routes.LOGIN),
            child: const Text("Login"),
          )
        ],
      ),
    );
  }

  Widget error() {
    return Center(
      child: Text("MAAF TERJADI ERROR"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());

    Widget cek() {
      return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return Material(
              child:
                  snapshot.data?.emailVerified == true ? adaIsi() : tidakAda(),
              // initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
            );
          } else {
            return error();
          }
        },
      );
    }

    Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        elevation: Get.isDarkMode ? 0 : 4,
        title: const Text('AL-QURAN'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: SearchAyat()),
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Container Last Read
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [ijoGelap, ijoTerang],
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 180,
                              height: 150,
                              child: Lottie.asset("assets/lottie/tulisan.json"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: putih,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Terakhir Dibaca",
                                      style: TextStyle(color: putih),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Al-Fatihah",
                                  style: TextStyle(color: putih, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
                                  "Juz 1 | Ayat 4",
                                  style: TextStyle(color: putih, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Tab Bar Tengah
              const TabBar(
                tabs: [
                  Tab(
                    text: "Surah",
                  ),
                  // Tab(
                  //   text: "Juz",
                  // ),
                  Tab(
                    text: "Bookmark",
                  )
                ],
              ),
              StreamBuilder(
                  stream: authC.streamAuthStatus,
                  builder: (context, snapshot) {
                    return Expanded(
                      child: TabBarView(children: [
                        //Tab Surah
                        FutureBuilder<List<Surah>>(
                            future: controller.ambilSemuaSurah(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (!snapshot.hasData) {
                                return const Center(
                                  child: Text("Tidak Ada Data"),
                                );
                              }
                              return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    Surah surah = snapshot.data![index];
                                    return ListTile(
                                      onTap: () {
                                        Get.toNamed(Routes.DETAIL,
                                            arguments: surah);
                                      },
                                      leading: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              Get.isDarkMode
                                                  ? "assets/img/borderDark.png"
                                                  : "assets/img/borderLight.png",
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${surah.number}",
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                          "Surah Al - ${surah.name?.transliteration?.id ?? 'Error'}"),
                                      subtitle: Text(
                                          "${surah.numberOfVerses} | ${surah.revelation?.id ?? 'Error'}"),
                                      trailing: Text(
                                          "${surah.name?.short ?? 'Error'}"),
                                    );
                                  });
                            }),

                        //=============================
                        //Tab Juz
                        // FutureBuilder<List<juz.Juz>>(
                        //   future: controller.ambilSemuaJuz(),
                        //   builder: (context, snapshot) {
                        // if (snapshot.connectionState ==
                        //     ConnectionState.waiting) {
                        //   return const Center(
                        //     child: CircularProgressIndicator(),
                        //   );
                        // }

                        // if (!snapshot.hasData) {
                        //   return const Center(
                        //     child: Text("Tidak Ada Data"),
                        //   );
                        // }
                        //     return ListView.builder(
                        //         itemCount: snapshot.data!.length,
                        //         itemBuilder: (context, index) {
                        //           juz.Juz detailJuz = snapshot.data![index];

                        //           return ListTile(
                        //             onTap: () {
                        //               Get.toNamed(Routes.JUZ_DETAIL,
                        //                   arguments: {
                        //                     "Juz": detailJuz,
                        //                   });
                        //             },
                        //             leading: Container(
                        //               height: 35,
                        //               width: 35,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                   image: AssetImage(
                        //                     Get.isDarkMode
                        //                         ? "assets/img/borderDark.png"
                        //                         : "assets/img/borderLight.png",
                        //                   ),
                        //                 ),
                        //               ),
                        //               child: Center(
                        //                 child: Text("${index + 1}"),
                        //               ),
                        //             ),
                        //             title: Text("Juz Ke - ${index + 1}"),
                        //             isThreeLine: true,
                        //             subtitle: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 Text("Mulai ${detailJuz.juzStartInfo}"),
                        //                 Text("Sampai ${detailJuz.juzEndInfo}"),
                        //               ],
                        //             ),
                        //           );
                        //         });
                        //   },
                        // ),
                        //============================

                        //Tab Bookmark
                        Column(
                          children: [
                            StreamBuilder<User?>(
                              stream: authC.streamAuthStatus,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.active) {
                                  print(snapshot.data);
                                  return Material(
                                    child: snapshot.data != null &&
                                            snapshot.data!.emailVerified == true
                                        ? adaIsi()
                                        : tidakAda(),
                                  );
                                } else {
                                  return cek();
                                }
                              },
                            )
                          ],
                        )
                      ]),
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayOpacity: .4,
        spaceBetweenChildren: 5,
        backgroundColor: ijoTerang,
        children: [
          //Tema
          SpeedDialChild(
            label: "Theme",
            child: ObxValue(
              (data) => Switch(
                value: controller.isLightTheme.value,
                onChanged: (val) {
                  controller.isLightTheme.value = val;
                  Get.changeThemeMode(
                    controller.isLightTheme.value
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
                  controller.saveThemeStatus();
                },
                activeColor: ijoTerang,
              ),
              false.obs,
            ),
            onTap: () {
              Get.changeThemeMode(
                controller.isLightTheme.value
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
              controller.saveThemeStatus();
            },
          ),
          SpeedDialChild(
            child: Obx(
              () => IconButton(
                onPressed: () {},
                icon: Icon(
                  controller.isLightTheme.value
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              ),
            ),
            onTap: () {
              Get.changeThemeMode(
                controller.isLightTheme.value
                    ? ThemeMode.light
                    : ThemeMode.dark,
              );
              controller.saveThemeStatus();
            },
          ),
          //Jadwal Sholat
          SpeedDialChild(
            label: "Jadwal Sholat",
            child: Icon(Icons.access_time_filled),
            onTap: () => Get.toNamed(Routes.PILIH_KOTA),
          ),
          //Akun
          SpeedDialChild(
            label: "Akun",
            child: const Icon(Icons.settings),
            onTap: () {},
          ),
          //Logout Sementara
          SpeedDialChild(
            label: "Logout",
            child: const Icon(Icons.power_settings_new_rounded),
            onTap: () => authC.Logout(),
          ),
        ],
      ),
    );
  }
}
