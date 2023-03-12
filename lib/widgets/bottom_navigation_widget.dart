import 'package:flutter/material.dart';
import 'package:seeri/common/colors_common.dart';

class ButtonNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final List<BottomNavigationBarItem> navigationItems;
  final List<String> itemRoutes;

  const ButtonNavigationWidget({
    required this.selectedIndex,
    required this.navigationItems,
    required this.itemRoutes,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      items: navigationItems,
      currentIndex: selectedIndex,
      selectedItemColor: SeeriColors.blue,
      unselectedItemColor: SeeriColors.grey,
      backgroundColor: SeeriColors.black3,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 25.0,
      onTap: (int index) {
        late List<String> items = itemRoutes;

        for (int i = 0; i <= items.length; i++) {
          if (index == i) {
            if(index == i) return;
            
            Navigator.pushNamed(context, itemRoutes[i]);
          }
        }
      },
    );
  }
}
