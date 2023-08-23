// ignore_for_file: file_names

import 'dart:io';

import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/pages/dashBoard.dart';
import 'package:agent_confirmation/pages/tracker.dart';
import 'package:agent_confirmation/pages/salaryBoard.dart';
import 'package:agent_confirmation/pages/scoreBoard.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'call/call.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _buildScreens() {
    return [
      const DashBorad(),
      const SalaryBoard(),
      const Call(
      ),
      const ScoreBoard(),
      const Tracker()
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  // List Of NAV Bar Items
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: Image.asset(
          "assets/images/Dashboard.png",
          color: unselectedIcon,
        ),
        icon: Image.asset(
          "assets/images/Dashboard.png",
          color: mainColor,
        ),
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: Image.asset(
          "assets/images/Payment.png",
          color: unselectedIcon,
        ),
        icon: Image.asset(
          "assets/images/Payment.png",
          color: mainColor,
        ),
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: Container(
          width: 70,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: unselectedIcon,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/images/call.png",
              color: unselectedIcon,
            ),
          ),
        ),
        icon: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: mainColor,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/images/call.png",
              color: mainColor,
            ),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: Image.asset(
          "assets/images/Score Board.png",
          color: unselectedIcon,
        ),
        icon: Image.asset(
          "assets/images/Score Board.png",
          color: mainColor,
        ),
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: Image.asset(
          "assets/images/To be confirmed1.png",
          color: unselectedIcon,
        ),
        icon: Image.asset(
          "assets/images/To be confirmed1.png",
          color: mainColor,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(context,
          navBarHeight: Platform.isIOS ? 60:70,
          bottomScreenMargin: Platform.isIOS ? 110 : 77,
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,

          //  backgroundColor: backGround,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(74.0),
            colorBehindNavBar: backGround,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 100),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.simple),
    );
  }
}
