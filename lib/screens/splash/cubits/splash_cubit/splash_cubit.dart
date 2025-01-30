
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maqsaf_app/screens/login/login_screen.dart';

import '../../../../../core/data/datasource/configuration/data_configuration.dart';
import '../../../../../core/data/datasource/storage/app_storage.dart';
import '../../../../widgets/components.dart';
import '../../../profile/cubits/user_cubit/user_cubit.dart';



part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState>    {
  SplashCubit() : super(const SplashState.initial());


  Future<void> _loadSplash(BuildContext context)  async {
    emit(const SplashState.loading());
    await AppStorage.instance.init();

    if(AppStorage.instance.readData(AppStorage.TOKEN)!=null)
    // await  BlocProvider.of<AuthCubit>(context).refreshToken( context);
    await  BlocProvider.of<UserCubit>(context).getProfile(context);
    else
    await Future.delayed( const Duration(seconds: 2), () {
      // context.pushReplacement(Routes.loginScreen);
      // context.pushAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) =>false);
      navigationPushAndRemoveUntil(context, const LoginScreen());
    });

  }
  Future<void> _initSplash(BuildContext context) async {
    emit(const SplashState.initial());
    await AppStorage.instance.init();
    await initDataConfiguration();


  }
  Future<void> initSplash(BuildContext context) async {
    await _initSplash(context);
     await _loadSplash(context);
  }




}
