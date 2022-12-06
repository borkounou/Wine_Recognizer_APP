import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import '../account/pages/account_page.dart';
import '../searcher/camera_page.dart';
import 'home_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  static const String routeName = '/bottomBar-page';

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedScreen = 0;
  static final List<Widget> _screenOptions = <Widget>[
    const MyHomePage(),
    const CameraPage(),
    const AccountScreen(),
  ];

  void iconOnTapped(int index) {
    selectedScreen = index;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white, //const Color(0xffE38B29),
      body: Center(child: _screenOptions[selectedScreen]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: iconOnTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xffE9C9A2),
        unselectedItemColor: const Color(0xFF526480),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            label: "Home",
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_camera_regular),
            label: "Camera",
            activeIcon: Icon(FluentSystemIcons.ic_fluent_camera_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            label: "Profile",
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
          ),
        ],
      ),
    );
  }
}
