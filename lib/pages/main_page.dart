import 'package:drive_ui/profiles/user.dart';
import 'package:flutter/material.dart';
import '../files.dart';
import '../kebab_menu.dart';

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
          Expanded(
            child: TabBarView(controller: tabController, children: [
              featured(accounts[currentUser].storage, context),
              notification(context)
            ]),
          )
        ],
      ),
    );
  }
}

Widget notification(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.notifications,
            size: screenWidth * (30 / 100),
            color: const Color.fromARGB(255, 254, 215, 50),
          ),
        ),
        Center(
          child: Text(
            "No New notifications",
            style: TextStyle(
                color: const Color.fromARGB(255, 73, 73, 73),
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * (6 / 100),
                fontFamily: "Poppins-Medium"),
          ),
        )
      ],
    ),
  );
}

Widget featured(List<Item> itemList, context) {
  return Scaffold(
    body: SizedBox(
      height: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemList.length >= 10 ? 10 : itemList.length,
        itemBuilder: (context, index) {
          return featuredElementCreator(context, itemList[index]);
        },
      ),
    ),
  );
}

Widget featuredElementCreator(context, Item item) {
  double screenWidth = MediaQuery.of(context).size.width;
  if (item.itemType == dir) {
    return const SizedBox.shrink();
  }
  return Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * (11 / 100),
              vertical: screenWidth * (2 / 100)),
          child: Row(
            children: [
              item.itemType,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  item.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * (4 / 100),
                      color: const Color.fromARGB(255, 73, 73, 73)),
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                iconSize: screenWidth * (6 / 100),
                onPressed: () {
                  item.recentCount = 3;
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15))),
                      context: context,
                      builder: (BuildContext context) {
                        return kebabmenu(context, item);
                      });
                }, //FILL ON PRESS//FILL ON PRESS//FILL ON PRESS
                icon: const Icon(
                  Icons.more_vert,
                  color: Color.fromARGB(255, 73, 73, 73),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: screenWidth * (80 / 100),
                height: screenWidth * (60 / 100) / 1.5,
                child: Image.network(
                  item.thumbnail,
                  fit: BoxFit.cover,
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * (11 / 100), bottom: screenWidth * (5 / 100)),
          child: Row(children: [
            accounts[currentUser].icon(context),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenWidth * (2 / 100)),
              child: Text(
                "Last opened ${item.lastOpened}",
                style: TextStyle(
                    fontSize: screenWidth * (3 / 100),
                    color: const Color.fromARGB(255, 73, 73, 73),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ]),
        )
      ],
    ),
  );
}
