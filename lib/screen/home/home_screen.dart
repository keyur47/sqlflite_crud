import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sqlflite_crud/screen/home/home_controller.dart';
import 'package:sqlflite_crud/utils/navigation_utils/navigation.dart';
import 'package:sqlflite_crud/widget/custom_button.dart';
import 'package:sqlflite_crud/widget/custom_textfield_view.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
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
                          child: const Text("Add Record"),
                          onPressed: () async {
                            await homeController.insertContact(
                                homeController.nameCon.text,
                                homeController.contactCon.text,
                                homeController.addressCon.text);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                        child: CustomButton(
                          child: const Text("Clear"),
                          onPressed: () {
                            homeController.nameCon.clear();
                            homeController.contactCon.clear();
                            homeController.addressCon.clear();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 30.w,
                    child: CustomButton(
                      child: const Text("View Contact"),
                      onPressed: () {
                        Get.toNamed(Routes.displayContact);
                      },
                    ),
                  ),
                ],
              ),
            ),
            homeController.isInsert.value
                ? Container(
                    height: 100.h,
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
