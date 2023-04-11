import 'package:drive_ui/data.dart';
import 'package:drive_ui/profiles/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // NestedScrollView so the top search bar can disappear
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: screenHeight * (8 / 100),
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                flexibleSpace: displayTopBar(context),
              )
            ];
          },
          // Loads the choosen page via the updated currentPage value from the pages list
          body: pages[currentPage]),

      // Used the themeing to change the colors and stylize it
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: const Color.fromARGB(255, 195, 229, 254),
            labelTextStyle: MaterialStatePropertyAll(TextStyle(
                fontSize: screenWidth * (3 / 100),
                fontWeight: FontWeight.w500))),
        child: NavigationBar(
          backgroundColor: const Color.fromARGB(255, 242, 245, 252),
          height: screenHeight * (9 / 100),
          selectedIndex: currentPage,
          onDestinationSelected: (currentPage) =>
              setState(() => this.currentPage = currentPage),
          //Used bar icons list from the data file
          destinations: barIcons,
        ),
      ),
    );
  }
}

Widget displayTopBar(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  //Padding the whole top bar stack and creating it
  return Padding(
      padding: EdgeInsets.fromLTRB(
          screenWidth * (3 / 100),
          screenHeight * (4 / 100),
          screenWidth * (3 / 100),
          screenHeight * (2 / 100)),
      child: Stack(
        children: [
          searchBarButton(context),
          // Left menu button
          IconButton(
            iconSize: screenWidth * (6 / 100),
            onPressed: () {}, //FILL ON PRESS//FILL ON PRESS//FILL ON PRESS
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 41, 45, 48),
            ),
          ),
          // Right profile button
          Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: screenWidth * (8 / 100),
                height: screenWidth * (8 / 100),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      elevation: 0,
                      backgroundColor: accounts[currentUser].color),
                  onPressed:
                      () {}, //FILL ON PRESS//FILL ON PRESS//FILL ON PRESS
                  child: Text(accounts[currentUser].userName[0]),
                ),
              ))
        ],
      ));
}

ElevatedButton searchBarButton(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 242, 245, 252)),
    onPressed: () {}, //FILL ON PRESS//FILL ON PRESS//FILL ON PRESS
    child: Align(
      alignment: Alignment.centerLeft,
      //This padding is to push the text to the right so the menu icon has a place
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 0.0, horizontal: screenWidth * (8 / 100)),
        child: const Text(
          "Search in Drive",
          style: TextStyle(
              color: Color.fromARGB(255, 80, 83, 89),
              fontWeight: FontWeight.w400),
        ),
      ),
    ),
  );
}
