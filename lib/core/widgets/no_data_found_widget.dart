
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../utils/assets_manager.dart';
import '../utils/color_manager.dart';
import '../utils/string_manager.dart';
import '../utils/style_manager.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({
    super.key,
    this.image = AssetsManager.noDataFoundIMG,
    this.text = StringManager.noDataFoundText,
    this.resultCount,
  });

  final String image;
  final String text;
  final int? resultCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SvgPicture.asset(
        //   image,
        //   fit: BoxFit.cover,
        // ),
        verticalSpace(12.h),
        if (resultCount != null) ...[
          Text(
            '${resultCount}' + ' ' + StringManager.resultText,
            style:
                StyleManager.font14SemiBold(color: ColorManager.primaryColor),
          )
        ],
        verticalSpace(12.h),
        Text(
          StringManager.noDataFoundText,
          style: StyleManager.font20SemiBold(
              color: ColorManager.nameTextHomeColor),
        )
      ],
    );
  }
}
