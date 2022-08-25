import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:jadwal_sholat_coba/data/models/allDetailHadis.dart';

class DetailhadisController extends GetxController {
  Future<allDetailHadist> ambilSemuaDetailH(String p) async {
    Uri url = Uri.parse("https://hadis-api-id.vercel.app/hadith/$p?page=10");
    var res = await http.get(url);

    print(res.body);
    Map<String, dynamic> map = json.decode(res.body);
    List<dynamic> data = map["items"];
    print("Ini Hasil " + map["items"].toString());
    // List? data = (json.decode(res.body) as List<dynamic>);

    return allDetailHadist.fromJson(map);
  }
}
