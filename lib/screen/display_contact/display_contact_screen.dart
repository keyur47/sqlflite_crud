import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sqlflite_crud/screen/display_contact/display_contact_controller.dart';
import 'package:sqlflite_crud/utils/navigation_utils/navigation.dart';

class DisplayContact extends StatelessWidget {
  DisplayContact({Key? key}) : super(key: key);

  DisplayController displayController = Get.put(DisplayController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: displayController.tableData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Name : ${displayController.tableData[index].name}"),
                                  SizedBox(height: 0.5.h),
                                  Text(
                                      "Contact : ${displayController.tableData[index].contact}"),
                                  SizedBox(height: 0.5.h),
                                  Text(
                                      "Address : ${displayController.tableData[index].address}"),
                                  SizedBox(height: 0.5.h),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.updateContact,
                                          arguments: displayController
                                              .tableData[index]);
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                  SizedBox(width: 2.w),
                                  IconButton(
                                    onPressed: () async {
                                      await displayController.deleteData(
                                          displayController
                                              .tableData[index].id);
                                      displayController.tableData
                                          .removeAt(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            displayController.isLoading.value ||
                    displayController.isDelete.value
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
