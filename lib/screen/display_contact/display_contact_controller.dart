import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlflite_crud/screen/display_contact/model/model.dart';
import 'package:sqlflite_crud/utils/database_helper.dart';
import 'package:sqlflite_crud/widget/snackbar.dart';

class DisplayController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  RxList<TaskModel> tableData = <TaskModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    readData();
    super.onInit();
  }

  ///ReadData From Database
  readData() async {
    tableData.clear();
    final db = await initDatabase;
    try {
      isLoading.value = true;
      List<Map> allData =
          await db!.rawQuery("select * from contact order by id desc");

      for (var data in allData) {
        log("Adding Data to List for display");
        TaskModel finalData = TaskModel.fromMap(data);
        tableData.add(finalData);
      }
    } catch (e) {
      log("ReadData--->${e.toString()}");
      getSnackBar("Some Error Occurs Read Data--->${e.toString()}",
          "Please Try Again", Colors.red.shade400, 3);
    } finally {
      isLoading.value = false;
    }
  }

  ///Delete Data From DataBase
  deleteData(id) async {
    final db = await initDatabase;
    try {
      isDelete.value = true;

      await db!.rawQuery("delete from contact where id=$id");

      getSnackBar(
          "Success", "Record deleted successfully", Colors.green.shade400, 3);
    } catch (e) {
      log("DeleteData--->${e.toString()}");
      getSnackBar("Some Error Occurs Deleting Data--->${e.toString()}",
          "Please Try Again", Colors.red.shade400, 3);
    } finally {
      isDelete.value = false;
    }
  }
}
