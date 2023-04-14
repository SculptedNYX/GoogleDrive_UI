import 'package:drive_ui/kebab_menu.dart';
import 'package:drive_ui/profiles/user.dart';
import 'package:flutter/material.dart';
import '../files.dart';

class Starred extends StatefulWidget {
  const Starred({super.key});

  @override
  State<Starred> createState() => _StarredState();
}

class _StarredState extends State<Starred> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Item> current = accounts[currentUser].storage;
    List<Item> starred = [];
    for (int i = 0; i < current.length; i++) {
      if (current[i].starred) {
        starred.add(current[i]);
      }
    }

    if (starred.isEmpty) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.star,
                size: screenWidth * (30 / 100),
                color: const Color.fromARGB(255, 254, 215, 50),
              ),
            ),
            Center(
              child: Text(
                "No Starred Items",
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

    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          itemCount: starred.length,
          itemBuilder: (context, index) {
            return elementCreator(context, starred[index]);
          },
        ),
      ),
    );
  }
}

Widget elementCreator(context, Item item) {
  double screenWidth = MediaQuery.of(context).size.width;
  String name = item.name;
  if (name.length >= 13) {
    name = "${name.substring(0, 11)}...";
  }
  if (item.itemType == dir) {
    return const SizedBox.shrink();
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
