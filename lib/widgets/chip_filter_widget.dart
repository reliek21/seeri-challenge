import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';

// ignore: must_be_immutable
class ChipFilterWidget extends StatefulWidget {
  final String name;
  late bool disabled;
  
  ChipFilterWidget({
    required this.name,
    this.disabled = true,
    super.key
  });

  @override
  State<ChipFilterWidget> createState() => _ChipFilterWidgetState();
}

class _ChipFilterWidgetState extends State<ChipFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          widget.disabled = !widget.disabled;
        })
      },
      child: Container(
        height: 38.0,
        width: 143.0,
        decoration: BoxDecoration(
          color: widget.disabled ? SeeriColors.black2 : SeeriColors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
        ),
        child: Center(
            child: Text(
          widget.name,
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