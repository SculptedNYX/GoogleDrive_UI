import 'package:drive_ui/kebab_menu.dart';
import 'package:drive_ui/profiles/user.dart';
import 'package:flutter/material.dart';
import '../dir.dart';
import '../files.dart';

class Offline extends StatefulWidget {
  const Offline({super.key});

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Item> current = accounts[currentUser].storage;
    List<Item> offline = [];
    for (int i = 0; i < current.length; i++) {
      if (current[i].offline) {
        offline.add(current[i]);
      }
    }

    if (offline.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 242, 245, 252),
          elevation: 0,
          title: Text(
            "Offline",
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
                Icons.cloud_off_rounded,
                size: screenWidth * (30 / 100),
                color: Colors.deepPurple,
              ),
            ),
            Center(
              child: Text(
                "No files on this device",
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
          "Offline",
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
            itemCount: offline.length,
            itemBuilder: (context, index) {
              return elementCreator(context, offline[index]);
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
