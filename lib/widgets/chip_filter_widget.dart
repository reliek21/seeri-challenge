import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';
import 'package:seeri/common/text_styles_common.dart';

// ignore: must_be_immutable
class ChipFilterWidget extends StatefulWidget {
  final String name;
  late bool isEnabled;
  
  ChipFilterWidget({
    required this.name,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  @override
  State<ChipFilterWidget> createState() => _ChipFilterWidgetState();
}

class _ChipFilterWidgetState extends State<ChipFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          widget.isEnabled = !widget.isEnabled;
        })
      },
      child: Container(
        height: 38.0,
        width: 143.0,
        decoration: BoxDecoration(
          color: widget.isEnabled ? SeeriColors.black2 : SeeriColors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
        ),
        child: Center(
          child: Text(
            widget.name,
            style: SeeriTextStyles().subHeadingTextStyle()
        )),
      ),
    );
  }
}