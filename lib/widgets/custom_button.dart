import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
     this.paddingHorizontal = 10,
     this.paddingVertical = 20,
     this.primaryColor = AppColor.secondaryColor,
     this.borderColor = Colors.transparent,
     this.textColor = AppColor.whiteColor,
    required this.txtSize,
    this.loading = false,
    this.radius = 15,
    this.bgOverlayColor = Colors.white70 ,
    this.iconPath,
    this.iconColor = Colors.white ,
    this.icon ,
    this.isUnderLineText = false ,
    this.alignmentText = Alignment.center ,
  });

  final String label;
  final double txtSize;
  final double radius;
  final Color primaryColor;
  final Color bgOverlayColor;
  final Color borderColor;
  final Color textColor;
  final bool loading;
  final double paddingHorizontal;
  final double paddingVertical;
  final void Function()? onTap;
  final String? iconPath;
  final Color iconColor;
  final Icon? icon;
  final bool isUnderLineText;
  final AlignmentGeometry alignmentText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          elevation: WidgetStateProperty.resolveWith<double>(  // As you said you dont need elevation. I'm returning 0 in both case
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return 0;
              }
              return 0; // Defer to the widget's default.
            },
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical,)
          ),
          backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return bgOverlayColor; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(width: 1, color: borderColor),
            ),
          ),
        ),
        child: loading ? const CircularProgressIndicator(
          color: AppColor.whiteColor,
        ) :  Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Expanded(child: Align(
              alignment: alignmentText ,
              child: Text(label, overflow: TextOverflow.ellipsis, style:TextStyle(color: textColor , fontSize: txtSize,fontWeight: FontWeight.w200 , decoration: isUnderLineText ? TextDecoration.underline : null ,decorationColor:textColor) ,),
            )),
            if(iconPath !=null || icon != null)
              const SizedBox(width: 5,),
            if(iconPath !=null) Image.asset(iconPath ?? '',color: iconColor,),
            if(icon != null) icon!,

          ],
        ),
      ),
    );
  }
}
