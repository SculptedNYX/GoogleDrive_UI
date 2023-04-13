import 'package:drive_ui/profiles/user.dart';
import 'package:flutter/material.dart';
import '../files.dart';

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> current = accounts[currentUser].storage;
    List<Item> recent = [];
    for (int i = 0; i < current.length; i++) {
      if (current[i].recentCount > 0) {
        current[i].recentCount--;
        recent.add(current[i]);
      }
    }
    double screenWidth = MediaQuery.of(context).size.width;
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
      body: SizedBox(
        height: double.maxFinite,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          scrollDirection: Axis.vertical,
          itemCount: recent.length,
          itemBuilder: (context, index) {
            return elementCreator(context, recent, index);
          },
        ),
      ),
    );
  }
}

Widget elementCreator(context, List<Item> recent, index) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: (Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: screenWidth * (30 / 100),
                  height: screenWidth * (40 / 100) / 1.5,
                  child: Image.network(
                    recent[index].thumbnail,
                    fit: BoxFit.cover,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                recent[index].itemType,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recent[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * (3 / 100)),
                    ),
                  ),
                ),
                IconButton(
                  iconSize: screenWidth * (6 / 100),
                  onPressed:
                      () {}, //FILL ON PRESS//FILL ON PRESS//FILL ON PRESS
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color.fromARGB(255, 41, 45, 48),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    )),
  );
}
