import 'package:flutter/material.dart';
import 'package:wine_recognizer/pages/admin/posts_page.dart';
import 'package:wine_recognizer/utils/app_styles.dart';
import '../order/services/order_services.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  OrderServices orderServices = OrderServices();
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(child: Text('Analytic page')),
    const Center(child: Text('Cart page')),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: StylesApp.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Admin',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),

              ElevatedButton(
                  onPressed: () {
                    orderServices.logOut(context);
                  },
                  child: const Text('Log out'))

              // AccountButton(
              //     text: "Log out",
              //     ontTap: () {
              //       orderServices.logOut(context);
              //     })
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: StylesApp.primaryColor,
        unselectedItemColor: StylesApp.container2Color,
        backgroundColor: StylesApp.container1Color,
        iconSize: 28,
        onTap: updatePage,
        currentIndex: _page,
        items: [
          // Posts
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? StylesApp.container2Color
                        : StylesApp.container3Color,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          //Analytics
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? StylesApp.container2Color
                        : StylesApp.container3Color,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.analytics_outlined),
            ),
            label: '',
          ),
          //orders
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? StylesApp.container2Color
                        : StylesApp.container3Color,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.all_inbox_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
