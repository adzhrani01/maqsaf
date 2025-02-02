import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets_path.dart';

class ImageUser extends StatelessWidget {
  const ImageUser({super.key, this.url, this.height, this.width, this.fit, this.radius, this.errorBuilder, this.backgroundColor});
  final String? url;
  final double? height;
  final double? width;
  final double? radius;
  final BoxFit? fit;
  final Widget? errorBuilder;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child:
      // CircleAvatar(
      //   backgroundColor: backgroundColor,
      //   radius: radius,
      //   child:
      Image.network(
          url??'',fit:fit,// BoxFit.fitHeight,
          height: height,
          width: width,
          frameBuilder:(context,widget,i,a)=>i!=null?widget:
          errorBuilder??
              Image.asset(AssetsPath.student,width: width,height: height,)??
              const Icon(Icons.person),

          errorBuilder:(context,_,__)=>
              errorBuilder??
                  Image.asset(AssetsPath.student,width: width,height: height,)??
                  const Icon(Icons.person),),
      );
    // );
  }
}
