import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      width: 143.0,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: const Center(
        child: Text(
          'Acción',
          style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w700),
        )
      ),
    );
  }
}