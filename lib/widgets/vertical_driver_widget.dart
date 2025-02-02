import 'package:flutter/material.dart';

class VerticalDriverWidget extends StatelessWidget {
  const VerticalDriverWidget({super.key, required this.height,  this.color = Colors.white});
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: VerticalDivider(
        color: color,
        thickness: 2,
        indent: 5,
        endIndent: 0,
        width: 20,
      ),
    );
  }
}
