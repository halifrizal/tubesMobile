import 'dart:convert';

import 'package:jadwal_sholat_coba/data/models/hadis.dart';

import '../../../../data/models/juz.dart';
import '../../../../data/models/surah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //All Surah
  List<Surah> allSurah = [];
  Future<List<Surah>> ambilSemuaSurah() async {
    Uri url = Uri.parse("https://tubesapisquran.herokuapp.com/surah");
    try {
      var res = await http.get(url);

      List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

      if (data == null || data.isEmpty) {
        return [];
      } else {
        allSurah = data.map((e) => Surah.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
      Get.snackbar("ERROR", "Tidak Bisa Ambil Data");
    }
    return allSurah;
  }

  //All Hadis
  List<hadis> allhadis = [];
  Future<List<hadis>> ambilSemuaHadis() async {
    Uri url = Uri.parse("https://hadis-api-id.vercel.app/hadith");
    try {
      var res = await http.get(url);
      print("======");
      print(res);
      print("======");
      List? data = (json.decode(res.body) as List<dynamic>);

      if (data == null || data.isEmpty) {
        return [];
      } else {
        allhadis = data.map((e) => hadis.fromJson(e)).toList();
        print("p");
      }
    } catch (e) {
      print(e);
      Get.snackbar("ERROR", "Tidak Bisa Ambil Data Hadis");
    }
    return allhadis;
  }

  //Search
  List<Surah> results = [];
  String urlList = 'https://tubesapisquran.herokuapp.com/surah';
  //var data = [];

  Future<List<Surah>> GetAllData({String? query}) async {
    Uri url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      List? data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      results = data!.map((e) => Surah.fromJson(e)).toList();
      if (query != null) {
        results = results
            .where((element) => element.name!.transliteration!.id!
                .toLowerCase()
                .contains((query.toLowerCase())))
            .toList();
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }

  //All Juz
  Future<List<Juz>> ambilSemuaJuz() async {
    List<Juz> semuaJuz = [];
    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse("https://api.quran.sutanlab.id/juz/$i");
      //Uri url = Uri.parse("https://tubesapisquran.herokuapp.com/juz/$i");
      var res = await http.get(url);

      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];

      // print("api Ke- https://api.quran.sutanlab.id/juz/$i");

      Juz juz = Juz.fromJson(data);
      semuaJuz.add(juz);
    }
    return semuaJuz;
  }

  //SharedPreferences Tema
  RxBool isLightTheme = false.obs;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isLightTheme.value);
  }

  getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}
