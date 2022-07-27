import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jadwal_sholat_coba/data/models/sholat.dart';

import '../../../../data/models/allCity.dart';
import 'package:http/http.dart' as http;

class JadwalController extends GetxController {
  var data = [];
  List<allCity> results = [];
  String urlList = 'https://api.myquran.com/v1/sholat/kota/semua';

  Future<List<allCity>> GetAllData({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      data = json.decode(response.body);
      results = data.map((e) => allCity.fromJson(e)).toList();
      if (query != null) {
        results = results
            .where((element) =>
                element.lokasi!.toLowerCase().contains((query.toLowerCase())))
            .toList();
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }

  //Get Jadwal
  List<Sholat> dataJadwal = [];

  Future<List<Sholat>> ambilJadwalSholat(
    int? id,
  ) async {
    final now = new DateTime.now();

    String tahun = DateFormat('y').format(now);
    String bulan = DateFormat('M').format(now);
    String hari = DateFormat('d').format(now);

    try {
      // Uri url =
      //     Uri.parse("https://api.myquran.com/v1/sholat/jadwal/1609/2021/06/23");
      Uri url = Uri.parse(
          "https://api.myquran.com/v1/sholat/jadwal/$id/$tahun/$bulan/$hari");
      var res = await http.get(url);

      List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

      print(url);
    } catch (e) {
      print(e);
    }
    if (data == null || data.isEmpty) {
      return [];
    } else {
      dataJadwal = data.map((e) => Sholat.fromJson(e)).toList();
      return dataJadwal;
    }
  }

  Future<Sholat> ambilDetailSholat(String id) async {
    final waktu = new DateTime.now();

    String tahun = DateFormat('y').format(waktu);
    String bulan = DateFormat('M').format(waktu);
    String hari = DateFormat('d').format(waktu);

    Uri url = Uri.parse(
        "https://api.myquran.com/v1/sholat/jadwal/$id/$tahun/$bulan/$hari");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    return Sholat.fromJson(data);
  }
}
