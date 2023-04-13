import 'package:drive_ui/profiles/user.dart';
import 'package:flutter/material.dart';

import '../files.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * (1 / 100)),
              child: Container(
                width: double.maxFinite,
                height: screenHeight * (6 / 100),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.grey))),
                child: TabBar(
                    labelColor: const Color.fromARGB(255, 9, 89, 218),
                    unselectedLabelColor: const Color.fromARGB(255, 69, 73, 74),
                    controller: tabController,
                    indicator: const UnderlineTabIndicator(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 9, 89, 218)),
                      insets: EdgeInsets.symmetric(horizontal: 60),
                    ),
                    tabs: const [
                      Tab(text: "Suggested"),
                      Tab(text: "Notifications")
                    ]),
              ),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(controller: tabController, children: [
              featured(accounts[currentUser].storage, context),
              const Text("There")
            ]),
          )
        ],
      ),
    );
  }
}

Widget featured(List<Item> itemList, context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return ListView(
    children: [
      SizedBox(
        height: double.maxFinite,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemList.length >= 10 ? 10 : itemList.length,
          itemBuilder: (context, index) {
            return Row(
              children: [],
            );
          },
        ),
      )
    ],
  );
}
