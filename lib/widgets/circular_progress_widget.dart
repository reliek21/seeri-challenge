import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';


class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: SeeriColors.yellow);
  }
}