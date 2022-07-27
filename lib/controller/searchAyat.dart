import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jadwal_sholat_coba/data-assets/warna.dart';
import 'package:jadwal_sholat_coba/data/models/allCity.dart';
import 'package:lottie/lottie.dart';

import '../app/modules/home/controllers/home_controller.dart';
import '../app/modules/jadwal/controllers/jadwal_controller.dart';
import '../data/models/surah.dart';
import '../routes/app_pages.dart';

class SearchAyat extends SearchDelegate {
  // JadwalController _userList = GetAllData();
  final ayat = Get.put(HomeController());

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      //scaffoldBackgroundColor: Colors.green,
      appBarTheme: const AppBarTheme(
        color: ijoGelap,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: ayat.GetAllData(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
                    Get.toNamed(Routes.DETAIL, arguments: surah);
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
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  title: Text(
                      "Surah Al - ${surah.name?.transliteration?.id ?? 'Error'}"),
                  subtitle: Text(
                      "${surah.numberOfVerses} | ${surah.revelation?.id ?? 'Error'}"),
                  trailing: Text("${surah.name?.short ?? 'Error'}"),
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            child: Lottie.asset("assets/lottie/detective_search.json"),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Cari Surah....',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
