import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlflite_crud/utils/database_helper.dart';
import 'package:sqlflite_crud/utils/navigation_utils/navigation.dart';
import 'package:sqlflite_crud/widget/snackbar.dart';

class UpdateController extends GetxController {
  RxBool isUpdate = false.obs;

  ///Update Data to Database
  updateContact(id, String name, String contact, String address) async {
    final db = await initDatabase;
    try {
      isUpdate.value = true;
      await db!.rawQuery(
          "update contact set name='${name.toString()}',contact='${contact.toString()}',address='${address.toString()}' where id=$id");
      Get.offAllNamed(Routes.home);
      getSnackBar(
          "Success", "Data Added Successfully", Colors.green.shade400, 3);
    } catch (e) {
      log("InsertData--->${e.toString()}");
      getSnackBar("Some Error Occurs Insert Data--->${e.toString()}",
          "Please Try Again", Colors.red.shade400, 3);
    } finally {
      isUpdate.value = false;
      //if you use get.offALLNamed then this want be needed, else you have to delete controller manually
      // Get.delete<
      //     HomeController>(); //to delete home controller. if this delete isn't called then when we go to homepage, it will be fill up with record that is being updated
      // Get.delete<DisplayController>();
    }
  }
}
