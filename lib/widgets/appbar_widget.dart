import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? disabledIcon;
  
  const AppBarWidget({
    super.key,
    required this.title,
    this.disabledIcon = false
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: SeeriColors.black1,
      shadowColor: SeeriColors.transparent,
      title: Text(
        title,
        style: const TextStyle(
          color: SeeriColors.white,
          fontFamily: 'Inter',
          fontSize: 26.0,
          fontWeight: FontWeight.w600
        )
      ),
      actions: [
        Icon(
          (disabledIcon == false) ? Icons.account_circle : null,
          color: SeeriColors.white,
          size: 28.33
        ),
        const Padding(padding: EdgeInsets.only(right: 15.0))
      ],
    );
  }
  
}