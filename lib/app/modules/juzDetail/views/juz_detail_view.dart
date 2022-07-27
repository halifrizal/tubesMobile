import '../../../../data-assets/warna.dart';
import '../../../../data/models/juz.dart' as juz;
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/juz_detail_controller.dart';

class JuzDetailView extends GetView<JuzDetailController> {
  final juz.Juz dataJuz = Get.arguments["Juz"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juz ${dataJuz.juz}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: dataJuz.verses?.length ?? 0,
        itemBuilder: (context, index) {
          if (dataJuz.verses?.length == 0 || dataJuz.verses?.length == null) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          }
          juz.Verses ayat = dataJuz.verses![index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                color: Get.isDarkMode ? bgDetail : putih,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundColor: ijoGelap,
                              child: Text(
                                "${ayat.number?.inSurah}",
                                style: const TextStyle(
                                  color: putih,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_add_outlined),
                            color: ijoGelap,
                          ),
                          IconButton(
                            onPressed: () {},
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
                  "${ayat.text?.arab}",
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
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
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
        },
      ),
    );
  }
}
