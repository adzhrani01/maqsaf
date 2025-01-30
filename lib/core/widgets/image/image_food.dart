import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets_path.dart';

class ImageFood extends StatelessWidget {
  const ImageFood({super.key, this.url, this.height, this.width, this.fit, this.radius, this.errorBuilder, this.backgroundColor, this.foregroundColor});
  final String? url;
  final double? height;
  final double? width;
  final double? radius;
  final BoxFit? fit;
  final Widget? errorBuilder;
  final Color? backgroundColor;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
        borderRadius:  BorderRadius.circular(15),
        child:
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child:
          Image.network(
            url??'',fit:fit,// BoxFit.fitHeight,
            height: height,
            width: width,
            frameBuilder:(context,widget,i,a)=>i!=null?widget:
            errorBuilder??
                Icon(Icons.fastfood,
                    color: foregroundColor,  size: width!=null?(width!/2.4):null)??
                Image.asset(AssetsPath.student,width: width,height: height,)??
                const Icon(Icons.person),

            errorBuilder:(context,_,__)=>
                Icon(Icons.fastfood,
                    color: foregroundColor, size: width!=null?(width!/2.4):null)??
            errorBuilder??
                Image.asset(AssetsPath.student,width: width,height: height,)??
                const Icon(Icons.person),)

        ),
      );


  }
}
