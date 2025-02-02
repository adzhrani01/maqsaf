import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoadBase extends StatelessWidget {
  const LoadBase({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return
      child??const SizedBox.shrink();
    //   Shimmer.fromColors(
    //   // baseColor: Theme.of(context).primaryColor.withOpacity(.20)!,
    //   // highlightColor: Theme.of(context).primaryColor.withOpacity(.10),
    //
    //   baseColor: ColorManager.grayColor.withOpacity(.20),
    //   highlightColor:  ColorManager.grayColor.withOpacity(.05),
    //   // enabled: _enabled,
    //   child: child??const SizedBox.shrink(),
    // );
  }


}
