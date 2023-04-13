import 'package:drive_ui/pages/main_page.dart';
import 'package:flutter/material.dart';

List<Widget> pages = const [
  MainPage(),
  Scaffold(
    body: Center(child: Text("2")),
  ),
  Scaffold(
    body: Center(child: Text("3")),
  ),
  Scaffold(
    body: Center(child: Text("4")),
  )
];

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

TextStyle logoStyleCreator(Color c, screenWidth) {
  return TextStyle(
      color: c,
      fontWeight: FontWeight.w400,
      fontSize: screenWidth * (6 / 100),
      fontFamily: "Poppins-Medium");
}

Row logo(context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Row(
    children: [
      RichText(
          text: TextSpan(
              style: TextStyle(
                  color: const Color.fromARGB(255, 73, 73, 73),
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * (6 / 100),
                  fontFamily: "Poppins-Medium"),
              children: <TextSpan>[
            TextSpan(
                text: "G",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 64, 134, 244), screenWidth)),
            TextSpan(
                text: "o",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 235, 65, 50), screenWidth)),
            TextSpan(
                text: "o",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 251, 189, 0), screenWidth)),
            TextSpan(
                text: "g",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 64, 134, 244), screenWidth)),
            TextSpan(
                text: "l",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 49, 170, 82), screenWidth)),
            TextSpan(
                text: "e ",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 235, 65, 50), screenWidth)),
            const TextSpan(text: "Drive")
          ]))
    ],
  );
}
