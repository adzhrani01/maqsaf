
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/screens/select_student_screen.dart';
import 'package:maqsaf_app/widgets/textfield.dart';


import '../../constants/assets_path.dart';
import '../../constants/colors_constants.dart';
import '../../helpers/size_config.dart';
import '../../widgets/components.dart';
import '../../widgets/custom_button.dart';
import '../core/cubits/auth_cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  login() async {

    await context.read<AuthCubit>().login(
      context,
      email: emailController.value.text,
      password: passwordController.value.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);
    return  SafeArea(child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:AppColor.primaryColor,
        body: Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: width * 0.05,),
          decoration: linearGradientDecoration(),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.20),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(AssetsPath.logo),
                  ),
                  SizedBox(height: height * 0.10),
                   CustomTextfield(
                    controller: emailController,
                    hintText: 'ادخل الايميل او اسم المستخدم',),
                  const SizedBox(height: 16),
                   CustomTextfield(
                     controller: passwordController,
                    hintText: 'ادخل كلمه المرور',),
                  SizedBox(height: height * 0.05),
                  Padding(padding: EdgeInsets.symmetric(horizontal: width * 0.10,),
                    child:                 CustomButton(
                      label: 'تسجيل الدخول',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                        login();
                       }

                        // navigationPush(context, const SelectStudentScreen());
                      },
                      txtSize: width * 0.04,
                    ),)
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}



