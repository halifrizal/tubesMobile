import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

import '../../../../data/models/detail_surah.dart';

class DetailController extends GetxController {
  final player = AudioPlayer();
  Future<DetailSurah> ambilDetailSurah(String id) async {
    Uri url = Uri.parse("https://tubesapisquran.herokuapp.com/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }

  void audioPlayer(String? url) async {
    if (url != null) {
      try {
        await player.setUrl(url);
        await player.play();
      } on PlayerException catch (e) {
        Get.snackbar("ERROR", "Error message: ${e.message}");
      } on PlayerInterruptedException catch (e) {
        Get.snackbar("ERROR", "Connection aborted: ${e.message}");
      } catch (e) {
        Get.snackbar("ERROR", "TIDAK BISA PLAY AUDIO");
      }
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
