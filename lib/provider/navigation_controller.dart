
import 'package:flutter/material.dart';
import 'package:shopping_cart_provider/screens/home_screen.dart';
import 'package:shopping_cart_provider/screens/seach_screen.dart';

import '../screens/location_screen.dart';
import '../screens/profie_screen.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;
   List<Widget> _screens = [
    const HomeScreen(),
     const SearchScreen(),
     const LocationScreen(),
     const ProfileScreen(),
    // Add other screens here
  ];

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<Widget> get screens => _screens;
}