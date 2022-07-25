import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlflite_crud/utils/database_helper.dart';
import 'package:sqlflite_crud/widget/snackbar.dart';

class HomeController extends GetxController {
  TextEditingController nameCon = TextEditingController();
  TextEditingController contactCon = TextEditingController();
  TextEditingController addressCon = TextEditingController();

  var docId;

  RxBool isInsert = false.obs;

  ///InsertData To Database
  insertContact(String name, String contact, String address) async {
    final db = await initDatabase;
    try {
      isInsert.value = true;
      await db?.rawQuery(
          "insert into contact(name,contact,address) values('${name.toString()}','${contact.toString()}','${address.toString()}')");
      nameCon.clear();
      contactCon.clear();
      addressCon.clear();
      getSnackBar(
          "Success", "Data Added Successfully", Colors.green.shade400, 3);
    } catch (e) {
      log("InsertData--->${e.toString()}");
      getSnackBar("Some Error Occurs Insert Data--->${e.toString()}",
          "Please Try Again", Colors.red.shade400, 3);
    } finally {
      isInsert.value = false;
    }
  }
}
