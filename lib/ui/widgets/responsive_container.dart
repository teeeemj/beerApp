// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  final Color color;
  const ResponsiveContainer({
    Key? key,
    required this.height,
    required this.width,
    this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: child,
    );
  }
}
