import 'package:flutter/material.dart';

class MovieCardWidget extends StatefulWidget {
  final List<dynamic> itemList;
  final bool? disabled;

  const MovieCardWidget({
    required this.itemList,
    this.disabled,
    super.key
  });

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}