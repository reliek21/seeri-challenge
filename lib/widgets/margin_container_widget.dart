import 'package:flutter/material.dart';

class MarginContainer extends StatelessWidget {
  final double? top;
  final double? bottom;
  final Widget child;

  const MarginContainer({
    required this.child,
    this.top,
    this.bottom,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    const double marginNumber = 0.0;
    return Container(margin: EdgeInsets.only(top: top ?? marginNumber, bottom: bottom ?? marginNumber));
  }
}