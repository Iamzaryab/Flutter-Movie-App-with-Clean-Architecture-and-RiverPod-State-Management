import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:filmku/features/bookmarks/presentation/screens/bookmark_screen.dart';
import 'package:filmku/features/home/presentation/screens/home_screen.dart';
import 'package:filmku/shared/widgets/app_bar.dart';
import 'package:filmku/shared/widgets/app_bottom_navigation.dart';
import 'package:filmku/shared/widgets/app_drawer.dart';

class HomePageView extends StatefulWidget {

  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body:homePageBody() ,
      bottomNavigationBar:  AppBottomNavigation(currentIndex: _currentIndex,onTapped: _onTabTapped,),
    );
  }
  void _onTabTapped(int index) {
    setState(() {
      log('index $index');
      _currentIndex = index;
    });
  }

  Widget homePageBody() {
    switch (_currentIndex) {
      case 0:
        return  const HomeScreen();
      case 1:
        return const BookmarkScreen();
      default:
        return Container();
    }
  }

}
