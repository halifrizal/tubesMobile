import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jadwal_sholat_coba/data-assets/warna.dart';
import 'package:jadwal_sholat_coba/data/models/allCity.dart';
import 'package:lottie/lottie.dart';

import '../app/modules/jadwal/controllers/jadwal_controller.dart';
import '../routes/app_pages.dart';
import '../app/modules/jadwal/controllers/jadwal_controller.dart';

class SearchUser extends SearchDelegate {
  // JadwalController _userList = GetAllData();
  final sholat = Get.put(JadwalController());

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
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<allCity>>(
        future: sholat.GetAllData(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Dapat Ditemukan"),
            );
          }
          List<allCity>? data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                allCity dataKota = snapshot.data![index];
                return ListTile(
                  onTap: () {
                    Get.toNamed(
                      Routes.JADWAL,
                      arguments: {
                        "City": dataKota,
                      },
                    );
                    print(dataKota.lokasi);
                    print(dataKota.id);
                  },
                  leading: Container(
                    height: 40,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("${dataKota.id}"),
                    ),
                  ),
                  title: Text(
                    '${dataKota.lokasi}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
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
            'Cari Kota....',
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

//search hadis
