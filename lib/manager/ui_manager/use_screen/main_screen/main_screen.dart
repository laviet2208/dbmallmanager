import 'package:flutter/material.dart';

import '../page/main_page/main_page.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  int selectedPage = 0;

  Widget get_body_widget() {
    if (selectedPage == 0) {
      return main_page();
    }
    if (selectedPage == 1) {

    }
    if (selectedPage == 2) {

    }
    if (selectedPage == 3) {

    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: get_body_widget(),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blueAccent.withOpacity(0.2),
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.blue)
            ),
            backgroundColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          ),
          child: NavigationBar(
            height: 70,
            selectedIndex: selectedPage,
            onDestinationSelected: (selectedPage) => setState(() {this.selectedPage = selectedPage;}),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: selectedPage == 0 ? Colors.blue : Colors.black,),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle_outlined, color: selectedPage == 1 ? Colors.blue : Colors.black,),
                label: 'Account',
              ),
              NavigationDestination(
                icon: Icon(Icons.search, color: selectedPage == 2 ? Colors.blue : Colors.black,),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.notifications_active_outlined, color: selectedPage == 3 ? Colors.blue : Colors.black,),
                label: 'Notice',
              ),
              NavigationDestination(
                icon: Icon(Icons.discount_outlined),
                label: 'Voucher',
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
