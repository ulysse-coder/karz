
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karz/core/constants/colors.dart';
import 'package:karz/core/constants/dimensions.dart';

void loadingDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      title: const Text('En cours de conection'),
      backgroundColor: Colors.transparent,
      content: Center(
        child: Column(
          children: [
            const CircularProgressIndicator(),
            SizedBox(height: height16,),
            Text(
              'Veuillez patienter...',
              style: TextStyle(
                color: primary,
                fontSize: font20,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    ),
  );
}