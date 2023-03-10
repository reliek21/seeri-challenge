import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';

class ChipFilterWidget extends StatelessWidget {
  final String name;
  
  const ChipFilterWidget({
    required this.name,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        height: 38.0,
        width: 143.0,
        decoration: const BoxDecoration(color: SeeriColors.blue, borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Center(
            child: Text(
          name,
          style: const TextStyle(
            color: SeeriColors.white,
            fontFamily: 'Inter',
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
    );
  }
}