import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({super.key, this.onTap, this.icon, required this.text});
  final GestureTapCallback? onTap;
  final String? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final width = SizeConfig.sizeWidth(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: 16,
        ),
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColor.primaryColor.withOpacity(0.03))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (icon == null)
              SizedBox(
                height: width * 0.05,
                width: width * 0.05,
              ),
            if (icon != null)
              Image.asset(
                icon!,
                height: width * 0.05,
                width: width * 0.05,
                fit: BoxFit.fill,
              ),
            const SizedBox(height: 12),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontSize: width * 0.03, color: AppColor.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
