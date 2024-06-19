import 'package:clone_e_commerce/screens/HistoryScreen.dart';
import 'package:flutter/material.dart';

import '../common_widget/AppBarWidget.dart';
import '../common_widget/BottomNavBarWidget.dart';
import '../common_widget/SearchWidget.dart';
import 'BannerListScreen.dart';
import 'CategoryListScreen.dart';
import 'ProductListScreen.dart';
import 'ProfileScreen.dart';
import 'WishlistScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    WishlistScreen(),
    HistoryScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchWidget(),
          const SizedBox(height: 10),
          BannerList(),
          const SizedBox(height: 10),
          CategoryListScreen(),
          const Expanded(
            child: ProductListScreen(),
          ),
        ],
      ),
    );
  }
}
