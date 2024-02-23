import 'package:api/views/getapi.dart';
import 'package:api/views/postapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: postapi(),
    ),
  );
}
