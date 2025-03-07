import 'package:flutter/material.dart';
import 'package:shein_mg_app/core/constants/app_color.dart';

class TitleTabBar extends StatelessWidget {
  const TitleTabBar({
    super.key,
    required this.tabController,
    required this.color,
    required this.titles,
  });

  final TabController tabController;
  final Color color;
  final List<Tab> titles;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      controller: tabController,
      labelColor: MesCouleurs.noir,
      labelStyle: const TextStyle(fontFamily: 'Montserrat_2'),
      unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat_3'),
      unselectedLabelColor: MesCouleurs.noir,
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: color,
      tabs: titles,
    );
  }
}
