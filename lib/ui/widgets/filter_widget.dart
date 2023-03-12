import 'package:flutter/material.dart';
import 'package:seeri/ui/widgets/chip_filter_widget.dart';

class FilterWidget extends StatelessWidget {
  final List<dynamic> itemList;

  const FilterWidget({
    required this.itemList,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) {        
        return Padding(padding: const EdgeInsets.only(left: 22.0),
          child: ChipFilterWidget(name: itemList[index].name),
        );
      },
    );
  }
}