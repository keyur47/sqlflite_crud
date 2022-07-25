import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sqlflite_crud/screen/display_contact/display_contact_controller.dart';
import 'package:sqlflite_crud/screen/home/home_controller.dart';
import 'package:sqlflite_crud/screen/update_contact/update_contact_controller.dart';
import 'package:sqlflite_crud/utils/navigation_utils/navigation.dart';
import 'package:sqlflite_crud/widget/custom_button.dart';
import 'package:sqlflite_crud/widget/custom_textfield_view.dart';

class UpdateContact extends StatelessWidget {
  UpdateContact({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final DisplayController displayController = Get.put(DisplayController());
  final UpdateController updateController = Get.put(UpdateController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      //this solves following exception
      // The following assertion was thrown while dispatching notifications for TextEditingController: setState() or markNeedsBuild() called during build.

      var data = Get.arguments;
      if (data != null) {
        homeController.docId = data.id;
        homeController.nameCon.text = data.name;
        homeController.contactCon.text = data.contact;
        homeController.addressCon.text = data.address;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                    titleText: 'Name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "Enter Name",
                    textEditingController: homeController.nameCon),
                CustomTextField(
                    titleText: 'Contact No.',
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    hintText: "Enter Contact Number",
                    textEditingController: homeController.contactCon),
                CustomTextField(
                    titleText: 'Address',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    hintText: "Enter Address",
                    textEditingController: homeController.addressCon),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 30.w,
                      child: CustomButton(
                        child: const Text("Update Record"),
                        onPressed: () async {
                          await updateController.updateContact(
                              homeController.docId,
                              homeController.nameCon.text,
                              homeController.contactCon.text,
                              homeController.addressCon.text);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                      child: CustomButton(
                        child: const Text("Delete Record"),
                        onPressed: () async {
                          await displayController
                              .deleteData(homeController.docId);
                          Get.offAllNamed(Routes.home);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          updateController.isUpdate.value || displayController.isDelete.value
              ? Container(
                  height: 100.h,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
