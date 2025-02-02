import 'package:flutter/material.dart';

import '../helpers/size_config.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.hintText, this.controller, this.validator, this.keyboardType});
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final width = SizeConfig.sizeWidth(context);
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(vertical: 2) ,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator ??
                (String? val) {
              if (val!.trim().isEmpty) return "هذا الحقل مطلوب";
              return null;
            },

        controller: controller,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: width * 0.03)),

      ),
    );
  }
}
