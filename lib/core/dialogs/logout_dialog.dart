
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maqsaf_app/core/helpers/extensions.dart';
import '../../helpers/size_config.dart';
import '../../screens/core/cubits/auth_cubit/auth_cubit.dart';
import '../../widgets/custom_button.dart';
import '../helpers/spacing.dart';
import '../utils/color_manager.dart';
import '../utils/string_manager.dart';
import '../utils/style_manager.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            trailing: GestureDetector(
              onTap: () => context.pop(),
              child: Icon(
                Icons.close,
                color: ColorManager.closeIconColor,
              ),
            ),
            title: Text(
              StringManager.logoutText,
              style: StyleManager.font16SemiBold(
                  color: ColorManager.nameTextHomeColor),
            ),
          ),
          verticalSpace(30.h),
          Text(
            textAlign: TextAlign.center,
            StringManager.areYouSureLogout,
            style: StyleManager.font16Regular(
              color: ColorManager.filterTextColor
            ),
          ),
          verticalSpace(30.h),
          Row(
            children: [
              Flexible(
                  child: CustomButton(
                    onTap: () {

                      context.read<AuthCubit>().logout(context);
                      /// Apply Filter
                    },
                    label: StringManager.logoutText,
                    txtSize: width * 0.04,
                  )),
              horizontalSpace(12.w),
              Flexible(
                child: CustomButton(
                  onTap: () {
                    /// Clear Filter
                    context.pop();
                  },
                  label: StringManager.cancel,
                  txtSize: width * 0.04,
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
