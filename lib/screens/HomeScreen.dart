import 'package:flutter/material.dart';

import '../common_widget/AppBarWidget.dart';
import '../common_widget/BottomNavBarWidget.dart';
import '../common_widget/SearchWidget.dart';
import 'BannerListScreen.dart';
import 'CategoryListScreen.dart';
import 'ProductListScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: Column(
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
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
