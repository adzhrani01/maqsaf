import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maqsaf_app/constants/assets_path.dart';
import 'package:maqsaf_app/constants/colors_constants.dart';
import 'package:maqsaf_app/core/dialogs/global_bottom_sheet.dart';
import '../../core/dialogs/logout_dialog.dart';
import '../../core/utils/color_manager.dart';
import '../../core/widgets/image/image_user.dart';
import '../../helpers/size_config.dart';
import '../../widgets/custom_button.dart';
import 'cubits/user_cubit/user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = SizeConfig.sizeWidth(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient:

            AppColor.myGradient??
                LinearGradient(
                  colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
          ),
          child: BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
              },
              buildWhen: (prev,next)=>next==UserState.save(),
              builder: (context, state) {
                final user= context.read<UserCubit>().user;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 300.h,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF2D91C0), Color(0xFF15445A)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: SafeArea(
                          bottom: false,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'الملف الشخصي',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset:  Offset(0, -230.h),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              _buildProfileImage(url:user?.image),
                              const SizedBox(height: 20),
                              Text(
                                user?.completeName??
                                    'محمد خالد الحربي',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AppColor.whiteColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'طالب',
                                  style: TextStyle(
                                    color:  AppColor.whiteColor,
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              _buildInfoItem(
                                'المدرسة',
                                'عبدالرحمن فقية',
                                Icons.school_outlined,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoItem(
                                'البريد الإلكتروني',
                                user?.email??
                                    'user@gmail.com',
                                Icons.email_outlined,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoItem(
                                'رقم الهوية',
                                '123456789',
                                Icons.credit_card_outlined,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoItem(
                                'العمر',

                                '${user?.age??'-'} سنة',
                                Icons.cake_outlined,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoItem(
                                'الطول',
                                '${user?.height??'-'} سم',
                                Icons.height_outlined,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoItem(
                                'الوزن',
                                '${user?.weight??'-'} كجم',
                                Icons.monitor_weight_outlined,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoItem(
                                'الجنس',
                                user?.gender??
                                    'ذكر',
                                Icons.person_outline,
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                child: CustomButton(
                                  label: 'تسجيل الخروج',
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: ColorManager.whiteColor,
                                        isScrollControlled: true,
                                        enableDrag: true,
                                        isDismissible: false,
                                        context: context,
                                        builder: (context) => LogoutDialog());
                                  },
                                  primaryColor: Colors.white,
                                  borderColor: Colors.red,
                                  textColor: Colors.red,
                                  txtSize: width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage({String? url}) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child:
        ImageUser(url: url,fit: BoxFit.cover),
        // Image.asset(
        //   AssetsPath.rectangle_student,
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF15445A).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF15445A),
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF15445A),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
