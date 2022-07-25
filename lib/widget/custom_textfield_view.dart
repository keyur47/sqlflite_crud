import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  String titleText;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  String hintText;
  TextEditingController textEditingController;
  bool? obscure;
  bool? focus;
  int? maxLength;
  FormFieldValidator<String>? validator;
  Widget? suffixIcon;
  AutovalidateMode? autoValidateMode;
  ValueChanged<String>? onChanged;
  CustomTextField(
      {super.key,
      required this.titleText,
      required this.keyboardType,
      required this.textInputAction,
      required this.hintText,
      this.obscure,
      this.maxLength,
      required this.textEditingController,
      this.validator,
      this.focus,
      this.suffixIcon,
      this.autoValidateMode,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(fontSize: 15.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.2.h),
            child: TextFormField(
              autovalidateMode: autoValidateMode,
              controller: textEditingController,
              validator: validator,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              obscureText: obscure ?? false,
              onChanged: onChanged,
              autofocus: focus ?? false,
              cursorColor: Colors.black,
              maxLength: maxLength,

              // maxLines: maxLines ?? 0,
              style: TextStyle(fontSize: 12.sp),
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Colors.black,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 12.sp),
                // suffix: GestureDetector(),
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
