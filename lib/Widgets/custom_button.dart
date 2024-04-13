import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/Const/color.dart';

Widget customButton(String buttonText, onTap) {
  return Container(
    width: Get.width * 1,
    height: Get.height * .06,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget customOutlineButton(String buttonText, onTap) {
  return Container(
      width: Get.width * .42,
      height: Get.height * .07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: color,
            width: 1),
      ),
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
Widget customOutline(String buttonText, onTap) {
  return Container(
      width: Get.width * 1,
      height: Get.height * .07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: color,
            width: 1),
      ),
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
