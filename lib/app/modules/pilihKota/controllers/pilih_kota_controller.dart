import 'dart:convert';

import 'package:get/get.dart';

import '../../../../data/models/allCity.dart';
import 'package:http/http.dart' as http;

class PilihKotaController extends GetxController {
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
}
