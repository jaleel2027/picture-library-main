// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picture_library/dashboard/controller/dashboard_controller.dart';
import 'package:picture_library/notification/view/notification_screen.dart';
import 'package:picture_library/settings/view/settings_screen.dart';
import 'package:picture_library/utils/color_utilities.dart';

import '../../widgets/bottom_bar_icon.dart';
import '../../home/view/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final PageController pageController = PageController(initialPage: 0);

  final DashboardController _dashboardController =
      Get.find(tag: DashboardController().toString());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder(
          init: _dashboardController,
          builder: (context) {
            return IndexedStack(
              index: _dashboardController.tabIndex,
              children: const [
                HomeScreen(),
                NotificationScreen(),
                SettingsScreen(),
              ],
            );
          }),
      bottomNavigationBar: GetBuilder(
          init: _dashboardController,
          builder: (context) {
            return Container(
              height: 90,
              margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.33),
                color: ColorUtilities.blueColor.withOpacity(0.1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomBarIconWidget(
                    onTap: () {
                      _dashboardController.changeTabIndex(0);
                    },
                    color: _dashboardController.tabIndex == 0
                        ? ColorUtilities.blueColor
                        : ColorUtilities.blackColor,
                    icon: Icons.home_filled,
                    height: 25,
                    width: 25,
                    label: 'Home',
                  ),
                  BottomBarIconWidget(
                    onTap: () {
                      _dashboardController.changeTabIndex(1);
                    },
                    color: _dashboardController.tabIndex == 1
                        ? ColorUtilities.blueColor
                        : ColorUtilities.blackColor,
                    icon: Icons.notifications,
                    height: 25,
                    width: 25,
                    label: 'Notifications',
                  ),
                  BottomBarIconWidget(
                    onTap: () {
                      _dashboardController.changeTabIndex(2);
                    },
                    color: _dashboardController.tabIndex == 2
                        ? ColorUtilities.blueColor
                        : ColorUtilities.blackColor,
                    icon: Icons.settings,
                    height: 25,
                    label: 'Settings',
                    width: 25,
                  ),
                ],
              ),
            );
          }),
    );
  }

  getScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const NotificationScreen();

      case 2:
        return const SettingsScreen();
    }
  }
}
