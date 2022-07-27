import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jadwal_sholat_coba/data-assets/warna.dart';
import 'package:jadwal_sholat_coba/data/models/allCity.dart';

import '../../../../controller/search.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/pilih_kota_controller.dart';

class PilihKotaView extends GetView<PilihKotaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Get.isDarkMode ? 0 : 4,
        title: const Text('PILIH KOTA'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchUser());
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Expanded(
          child: FutureBuilder<List<allCity>>(
              future: controller.GetAllData(),
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
                      allCity city = snapshot.data![index];
                      return ListTile(
                        onTap: () {
                          Get.toNamed(
                            Routes.JADWAL,
                            arguments: {
                              "City": city,
                            },
                          );
                          print(city.lokasi);
                          print(city.id);
                        },
                        leading: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Get.isDarkMode ? putih : Colors.black,
                              width: 5,
                            ),
                          ),
                          child: Center(
                            child: Text("${city.id}"),
                          ),
                        ),
                        title: Text(
                          "${city.lokasi}",
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
