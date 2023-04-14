import 'package:drive_ui/kebab_menu.dart';
import 'package:drive_ui/profiles/user.dart';
import 'package:flutter/material.dart';
import '../files.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Item> current = accounts[currentUser].storage;
    List<Item> recent = [];
    for (int i = 0; i < current.length; i++) {
      if (current[i].recentCount > 0) {
        current[i].recentCount--;
        recent.add(current[i]);
      }
    }

    if (recent.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 242, 245, 252),
          elevation: 0,
          title: Text(
            "Recent",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: screenWidth * (5 / 100)),
          ),
          actions: [
            InkWell(onTap: () {}, child: const Icon(Icons.search)),
            const SizedBox(width: 10),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                color: Colors.red,
                Icons.replay,
                size: screenWidth * (30 / 100),
              ),
            ),
            Center(
              child: Text(
                "No recent files",
                style: TextStyle(
                    color: const Color.fromARGB(255, 73, 73, 73),
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * (8 / 100),
                    fontFamily: "Poppins-Medium"),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 242, 245, 252),
        elevation: 0,
        title: Text(
          "Recent",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: screenWidth * (5 / 100)),
        ),
        actions: [
          InkWell(onTap: () {}, child: const Icon(Icons.search)),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: double.maxFinite,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            scrollDirection: Axis.vertical,
            itemCount: recent.length,
            itemBuilder: (context, index) {
              return elementCreator(context, recent[index]);
            },
          ),
        ),
      ),
    );
  }
}

Widget elementCreator(context, Item item) {
  if (item.itemType == dir) {
    return const SizedBox.shrink();
  }
  double screenWidth = MediaQuery.of(context).size.width;
  String name = item.name;
  if (name.length >= 13) {
    name = "${name.substring(0, 11)}...";
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
              }, //FILL ON PRESS//FILL ON PRESS//FILL ON PRESS
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
