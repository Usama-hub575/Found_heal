import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension Extension on Widget {
  Widget toProgress(RxBool isLoading) {
    return Obx(
      () => isLoading.value == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : this,
    );
  }
}
