import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coba_controller.dart';

class CobaView extends GetView<CobaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CobaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CobaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
