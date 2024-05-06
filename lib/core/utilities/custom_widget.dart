
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void loadingDialog() {
  Get.dialog(
    barrierDismissible: false,
    const AlertDialog(
      title: Text('En cours de conection'),
      backgroundColor: Colors.transparent,
      content: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}