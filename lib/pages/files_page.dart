import 'package:flutter/material.dart';
import '../dir.dart';
import '../files.dart';
import '../kebab_menu.dart';
import '../profiles/user.dart';

class Files extends StatefulWidget {
  const Files({super.key});

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TabController tabController = TabController(length: 3, vsync: this);
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
                      insets: EdgeInsets.symmetric(horizontal: 35),
                    ),
                    tabs: const [
                      Tab(text: "My Drive"),
                      Tab(text: "Shared drives"),
                      Tab(text: "Computers")
                    ]),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              myDrive(accounts[currentUser].storage, context),
              emptyTab(
                  context,
                  "No shared drives",
                  Icon(
                    Icons.interests,
                    size: screenWidth * (30 / 100),
                    color: Colors.blue,
                  )),
              emptyTab(
                  context,
                  "No folders syncing with Drive",
                  Icon(
                    Icons.computer_sharp,
                    size: screenWidth * (30 / 100),
                    color: Colors.lightGreen,
                  )),
            ]),
          )
        ],
      ),
    );
  }
}

Widget emptyTab(context, String text, Icon icon) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: icon),
        Center(
          child: Text(
            text,
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

Widget myDrive(List<Item> itemList, context) {
  return Scaffold(
    body: SizedBox(
      height: double.maxFinite,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return elementCreator(context, itemList[index], index);
        },
      ),
    ),
  );
}

Widget elementCreator(context, Item item, index) {
  double screenWidth = MediaQuery.of(context).size.width;
  String name = item.name;
  if (name.length >= 13) {
    name = "${name.substring(0, 11)}...";
  }

  if (item.itemType == dir) {
    return Stack(alignment: Alignment.topCenter, children: [
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: screenWidth * (40 / 100),
              height: screenWidth * (40 / 100) / 1.5,
              child: Icon(
                Icons.folder,
                color: const Color.fromARGB(255, 73, 73, 73),
                size: screenWidth * (40 / 100) / 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * (3 / 100)),
                  ),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  iconSize: screenWidth * (6 / 100),
                  onPressed: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15))),
                        context: context,
                        builder: (BuildContext context) {
                          return kebabmenu(context, item);
                        });
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color.fromARGB(255, 41, 45, 48),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(0, 0, 0, 0), elevation: 0),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DirPage(
                      dir: item as Dir,
                    )));
          },
          child: SizedBox(
              width: screenWidth * (40 / 100) / 1.5,
              height: screenWidth * (40 / 100) / 1.5))
    ]);
  }

  return (Column(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            width: screenWidth * (40 / 100),
            height: screenWidth * (40 / 100) / 1.5,
            child: Image.network(
              item.thumbnail,
              fit: BoxFit.cover,
            ),
          )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            item.itemType,
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * (3 / 100)),
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
              },
              icon: const Icon(
                Icons.more_vert,
                color: Color.fromARGB(255, 41, 45, 48),
              ),
            ),
          ],
        ),
      )
    ],
  ));
}
