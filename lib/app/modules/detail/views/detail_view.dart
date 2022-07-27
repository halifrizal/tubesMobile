import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../data/models/detail_surah.dart' as detail;
import '../../../../data-assets/warna.dart';
import '../../../../data/models/surah.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final Surah surah = Get.arguments;
  //late final detail.DetailSurah detailSurah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Get.isDarkMode ? 0 : 4,
        title: Text('Surah ${surah.name?.transliteration?.id ?? 'Error'}'),
        //centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.toNamed(Routes.SEARCH),
                icon: const Icon(Icons.search),
              ),
            ],
          )
        ],
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
                    "${surah.name?.transliteration?.id ?? 'Error'}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.black : putih,
                    ),
                  ),
                  Text(
                    "| ${surah.name?.translation?.id ?? 'Error'} |",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.black : putih,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${surah.numberOfVerses ?? 'Error'} Ayat",
                    style: TextStyle(
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.black : putih,
                    ),
                  ),
                  Text(
                    "Diturunkan Di ${surah.revelation?.id ?? 'Error'}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.black : putih,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tafsir Surah : ${surah.tafsir?.id ?? 'Error'}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.black : putih,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Bagian Surah
          FutureBuilder<detail.DetailSurah>(
              future: controller.ambilDetailSurah(surah.number.toString()),
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
                    itemCount: snapshot.data?.verses?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (snapshot.data?.verses?.length == 0) {
                        return const SizedBox();
                      }
                      detail.Verse? ayat = snapshot.data?.verses?[index];
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
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.bookmark_add_outlined),
                                        color: ijoGelap,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.audioPlayer(
                                              ayat?.audio?.primary);
                                        },
                                        icon: const Icon(Icons.play_arrow),
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
                              "${ayat!.text?.arab}",
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
                            "${ayat.text?.transliteration?.en}",
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
                          Text(
                            "${ayat.translation?.id}",
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    });
              })
        ],
      ),
    );
  }
}
