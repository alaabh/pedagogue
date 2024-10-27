import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tab_item.dart';
import 'package:pedagogue/shared/style/app_color.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final TabController controller;
  final List<String> tabTitles;
  final List<TabItem> tabItems;

  const BottomNavigationBarWidget({
    super.key,
    required this.controller,
    required this.tabTitles,
    required this.tabItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.primaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, -1),
            blurRadius: 10,
          )
        ],
      ),
      child: TabBar(
        controller: controller,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.only(bottom: 65),
        labelPadding: EdgeInsets.zero,
        labelColor: AppColors.primaryColor,
        indicatorColor: AppColors.primaryColor,
        tabs: List.generate(
          tabItems.length,
          (index) => Tab(
            child: Column(
              children: [
                Image.asset(
                  tabItems[index].iconData,
                  width: MediaQuery.of(context).size.width * 0.075,
                ),
                //  Icon(tabItems[index].iconData),
                Expanded(
                  child: Text(
                    tabTitles[index],
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
