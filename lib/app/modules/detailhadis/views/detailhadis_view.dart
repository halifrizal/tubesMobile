import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jadwal_sholat_coba/data/models/hadis.dart';
import '../../../../data/models/allDetailHadis.dart';
import '../../../../data-assets/warna.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/detailhadis_controller.dart';

class DetailhadisView extends GetView<DetailhadisController> {
  final hadis getHadis = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Get.isDarkMode ? 0 : 4,
        title: Text('HR. ${getHadis.name}'),
        //centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //Card Atas
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [bgDetail, ijoTerang],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "${getHadis.name}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.black : putih,
                    ),
                  ),
                  Text(
                    "| Total Hadist : ${getHadis.total} |",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.black : putih,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Bagian Surah
          FutureBuilder<allDetailHadist>(
              future: controller.ambilSemuaDetailH(getHadis.slug.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: const Text("Tidak Ada Data"),
                  );
                }

                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (snapshot.data == 0) {
                        return const SizedBox();
                      }
                      Items? detailH = snapshot.data?.items?[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //===================
                          //Card Number, Play Button,Bookmark
                          //===================
                          Card(
                            color: Get.isDarkMode ? bgDetail : putih,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ijoGelap,
                                    child: Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                        color: putih,
                                      ),
                                    ),
                                  ),
                                  Text("HR. ${getHadis.name}"),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.bookmark_add_outlined),
                                        color: ijoGelap,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //===================
                          //Text Arab
                          //===================
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "${detailH?.arab}",
                              style: const TextStyle(fontSize: 25),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //===================
                          //Text translate Arab
                          //===================
                          Text(
                            "${detailH?.id}",
                            style: const TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //===================
                          //Text translate ID
                          //===================
                        ],
                      );
                    });
              })
        ],
      ),
    );
  }
}
