import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jadwal_sholat_coba/data-assets/warna.dart';
import 'package:jadwal_sholat_coba/data/models/sholat.dart' as dataSholat;
import 'package:jadwal_sholat_coba/routes/app_pages.dart';

import '../../../../data/models/allCity.dart';
import '../../../../controller/search.dart';
import '../controllers/jadwal_controller.dart';

class JadwalView extends GetView<JadwalController> {
  final sholat = Get.put(JadwalController(), permanent: true);

  TextEditingController osas = TextEditingController();
  final Color color1 = Color(0xFF32CD32);
  final Color color2 = Color(0xFF175E17);
  final Color color3 = Color(0xFF208320);
  final String tmp = "Pilih Tempat Dahulu";
  final allCity dataCity = Get.arguments["City"];
  // final allCity dataId = Get.arguments["Id"];

  @override
  Widget build(BuildContext context) {
    print(dataCity.lokasi);
    print(dataCity.id);
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height / 1,
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              // color: ijoTerang,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Arrow dan Search
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Get.toNamed(Routes.HOME),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: SearchUser());
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                //Text Atas
                //=========
                const Text(
                  "Jadwal Sholat",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const Text(
                  "Shalat jadi tepat waktu",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                //========
                const SizedBox(
                  height: 25,
                ),
                //Lokasi
                _iconText(
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 15,
                  ),
                  "",
                  "Lokasi Saat ini",
                ),
                const SizedBox(
                  height: 15,
                ),
                //Tanggal
                _dateText(
                  const Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                    size: 15,
                  ),
                  "",
                  "Tanggal Hari Ini",
                ),
                const SizedBox(
                  height: 20,
                ),
                //Imsak
                FutureBuilder<dataSholat.Sholat>(
                  future: controller.ambilDetailSholat(dataCity.id.toString()),
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
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          dataSholat.Jadwal? dataS = snapshot.data?.jadwal;

                          return _waktuSholat("imsak", "${dataS?.imsak}");
                        });
                  },
                ),

                const SizedBox(
                  height: 15,
                ),
                // //Subuh
                FutureBuilder<dataSholat.Sholat>(
                  future: controller.ambilDetailSholat(dataCity.id.toString()),
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
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          dataSholat.Jadwal? dataS = snapshot.data?.jadwal;

                          return _waktuSholat("Subuh", "${dataS?.subuh}");
                        });
                  },
                ),

                const SizedBox(
                  height: 15,
                ),
                //Dzuhur
                FutureBuilder<dataSholat.Sholat>(
                  future: controller.ambilDetailSholat(dataCity.id.toString()),
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
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          dataSholat.Jadwal? dataS = snapshot.data?.jadwal;

                          return _waktuSholat("Dzuhur", "${dataS?.dzuhur}");
                        });
                  },
                ),

                const SizedBox(
                  height: 15,
                ),
                //Azhar
                FutureBuilder<dataSholat.Sholat>(
                  future: controller.ambilDetailSholat(dataCity.id.toString()),
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
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          dataSholat.Jadwal? dataS = snapshot.data?.jadwal;

                          return _waktuSholat("Azhar", "${dataS?.ashar}");
                        });
                  },
                ),

                const SizedBox(
                  height: 15,
                ),
                //Maghrib
                FutureBuilder<dataSholat.Sholat>(
                  future: controller.ambilDetailSholat(dataCity.id.toString()),
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
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          dataSholat.Jadwal? dataS = snapshot.data?.jadwal;

                          return _waktuSholat("Maghrib", "${dataS?.maghrib}");
                        });
                  },
                ),

                const SizedBox(
                  height: 25,
                ),
                //Isya'
                FutureBuilder<dataSholat.Sholat>(
                  future: controller.ambilDetailSholat(dataCity.id.toString()),
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
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          dataSholat.Jadwal? dataS = snapshot.data?.jadwal;

                          return _waktuSholat("Isya'", "${dataS?.isya}");
                        });
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _iconText(Icon icon, String title, String subTitle) {
    double h = 30;
    double w = 30;
    Container left = Container(
      width: w,
      height: h,
      //color: color3,
      decoration: BoxDecoration(
          color: color3, borderRadius: BorderRadius.circular(w / 2)),
      child: icon,
    );

    Column right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (Get.arguments == null)
          const Text("Pilih Kota Dahulu",
              style: TextStyle(color: Colors.white)),
        if (Get.arguments != null)
          Text("${dataCity.lokasi}",
              style: const TextStyle(color: Colors.white)),
        Text(subTitle,
            style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );

    return Row(
      children: <Widget>[
        left,
        const SizedBox(
          width: 10,
        ),
        right
      ],
    );
  }

  Widget _dateText(Icon icon, String title, String subTitle) {
    final now = new DateTime.now();
    String hariIni = DateFormat('yMd').format(now);

    double h = 30;
    double w = 30;
    Container left = Container(
      width: w,
      height: h,
      // color: color3,
      decoration: BoxDecoration(
          color: color3, borderRadius: BorderRadius.circular(w / 2)),
      child: icon,
    );

    Column right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${hariIni}",
          style: const TextStyle(color: Colors.white),
        ),
        Text(subTitle,
            style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );

    return Row(
      children: <Widget>[
        left,
        const SizedBox(
          width: 10,
        ),
        right
      ],
    );
  }

  Widget _waktuSholat(String name, String time) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color2, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Text(
                time,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.alarm, color: Colors.white)
            ],
          )
        ],
      ),
    );
  }
}
