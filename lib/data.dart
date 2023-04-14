import 'package:drive_ui/pages/files_page.dart';
import 'package:drive_ui/pages/main_page.dart';
import 'package:drive_ui/pages/shared_page.dart';
import 'package:drive_ui/pages/starred_page.dart';
import 'package:flutter/material.dart';

List<Widget> pages = const [MainPage(), Starred(), Shared(), Files()];

// Main colors for the icons
Color iconDeselected = const Color.fromARGB(255, 69, 73, 74);
Color iconSelected = const Color.fromARGB(255, 0, 27, 54);

// List of all the bottom bar buttons
List<Widget> barIcons = [
  NavigationDestination(
      icon: Icon(Icons.home_outlined, color: iconDeselected),
      selectedIcon: Icon(Icons.home_filled, color: iconSelected),
      label: "Home"),
  NavigationDestination(
      icon: Icon(Icons.star_border, color: iconDeselected),
      selectedIcon: Icon(Icons.star_outlined, color: iconSelected),
      label: "Starred"),
  NavigationDestination(
      icon: Icon(Icons.people_alt_outlined, color: iconDeselected),
      selectedIcon: Icon(Icons.people_alt, color: iconSelected),
      label: "Shared"),
  NavigationDestination(
      icon: Icon(Icons.folder_open, color: iconDeselected),
      selectedIcon: Icon(Icons.folder, color: iconSelected),
      label: "Files")
];
