import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';

class FavoriteBottomWidget extends StatelessWidget {
  final Widget icon;
  final Color color;
  final void Function()? onPress;

  const FavoriteBottomWidget({
    required this.color,
    required this.icon,
    required this.onPress,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: SeeriColors.transparent,
      onPressed: onPress,
      icon: icon,
      color: color,
      iconSize: 25.0,
    );
  }
}