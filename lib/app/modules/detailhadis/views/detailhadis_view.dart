import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailhadis_controller.dart';

class DetailhadisView extends GetView<DetailhadisController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailhadisView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailhadisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
